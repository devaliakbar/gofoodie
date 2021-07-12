import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/local_storage/local_storage.dart';
import 'package:gofoodie/core/services/local_storage/ls_user.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/authentication/presentation/pages/login_page.dart';
import 'package:gofoodie/features/order/data/models/order_model.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/my_order_content.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/order_divider.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/order_vendor_info.dart';
import 'package:gofoodie/injection_container.dart';

class CurrentOrderTab extends StatefulWidget {
  @override
  _CurrentOrderTabState createState() => _CurrentOrderTabState();
}

class _CurrentOrderTabState extends State<CurrentOrderTab> {
  List<OrderModel> orders;

  final LSUser _lsUser = LSUser();
  ApiHelper _apiHelper;

  bool _isCancelBtnEnabled = true;

  @override
  void initState() {
    super.initState();

    _apiHelper = ApiHelper(user: _lsUser);

    _getCurrentOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.height(2),
      ),
      child: orders == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: SizeConfig.height(0.15),
                        color: AppColors.lightBlack.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(
                      SizeConfig.height(0.5),
                    ),
                  ),
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.width(5),
                      left: SizeConfig.width(5),
                      right: SizeConfig.width(5)),
                  child: Column(
                    children: [
                      OrderVendorInfo(
                        orderModel: orders[index],
                      ),
                      OrderDivider(),
                      MyOrderContent(
                        order: orders[index],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.width(3)),
                        child: NormalText(
                          "ORDERED ON",
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: SizeConfig.height(1)),
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.width(3),
                        ),
                        child: NormalText(
                          orders[index].time,
                          color: AppColors.black,
                        ),
                      ),
                      OrderDivider(),
                      Container(
                        color: AppColors.lightGrey,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            onPressed: !_isCancelBtnEnabled
                                ? null
                                : () => _cancelOrder(orders[index].orderId),
                            child: NormalText(
                              "Cancel Order",
                              color: _isCancelBtnEnabled
                                  ? AppColors.red
                                  : AppColors.red.withOpacity(0.5),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }

  Future<void> _getCurrentOrder() async {
    int userId = await _lsUser.getUserId();

    if (userId == null) {
      sl<LocalStorage>().clearAllLocalData();
      Navigator.of(context).pushNamedAndRemoveUntil(
          LoginPage.routeName, (Route<dynamic> route) => false);
      return;
    }

    try {
      Response response = await Dio().post(
          _apiHelper.appendPath(path: "orderHistory"),
          options: await _apiHelper.getHeaders(withToken: false),
          data: {"user_id": userId, "page": 1});

      orders = [];

      final result = await response.data;

      result['orders']['data'].forEach((element) {
        orders.add(OrderModel.fromJson(element));
      });

      setState(() {});
    } catch (e) {
      return ShowToast("Failed to fetch");
    }
  }

  Future<void> _cancelOrder(int orderId) async {
    setState(() {
      _isCancelBtnEnabled = false;
    });

    int userId = await _lsUser.getUserId();

    if (userId == null) {
      sl<LocalStorage>().clearAllLocalData();
      Navigator.of(context).pushNamedAndRemoveUntil(
          LoginPage.routeName, (Route<dynamic> route) => false);
      return;
    }

    try {
      Response response = await Dio().post(
        _apiHelper.appendPath(path: "cancelOrder?id=$orderId&userid=$userId"),
        options: await _apiHelper.getHeaders(withToken: false),
      );

      if (response.statusCode == 200) {
        orders = null;

        setState(() {
          _isCancelBtnEnabled = true;
        });

        _getCurrentOrder();
      } else {
        setState(() {
          _isCancelBtnEnabled = true;
        });
        return ShowToast("Failed to cancel");
      }
    } catch (e) {
      setState(() {
        _isCancelBtnEnabled = true;
      });

      return ShowToast("Failed to cancel");
    }
  }
}
