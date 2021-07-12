import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/local_storage/ls_user.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/core/widgets/success_dialogue.dart';
import 'package:gofoodie/features/home/presentation/pages/home.dart';

class PaymentMethod extends StatefulWidget {
  static const String routeName = '/payment_method';

  final Map<String, dynamic> form;

  PaymentMethod({@required this.form});

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.black),
        title: NormalText(
          "Select Payment Method",
          color: AppColors.black,
          boldText: true,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.width(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NormalText("SELECT A MODE TO PAY ₹25.00"),
              Card(
                margin: EdgeInsets.only(
                  top: SizeConfig.height(2),
                ),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    SizeConfig.width(1),
                  ),
                ),
                child: InkWell(
                  onTap: () => _createOrder(context),
                  child: Padding(
                    padding: EdgeInsets.all(
                      SizeConfig.width(5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.home_work_outlined,
                          size: IconSizes.iconSizeL,
                          color: AppColors.lightBlack,
                        ),
                        SizedBox(
                          width: SizeConfig.width(5),
                        ),
                        NormalText(
                          "Cash On Delivery",
                          color: AppColors.black,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createOrder(BuildContext context) async {
    final ApiHelper apiHelper = ApiHelper(user: LSUser());

    try {
      final Response response = await Dio().post(
          apiHelper.appendPath(path: "create_order"),
          options: await apiHelper.getHeaders(),
          data: widget.form);

      if (response.statusCode != 201) {
        return ShowToast("Failed to create order");
      }
    } on DioError catch (e) {
      print(e.message);
      return ShowToast("Failed to create order");
    }

    showDialog(
      context: context,
      builder: (_) => SuccessDialogue(),
    ).then((value) => Navigator.of(context).pushNamedAndRemoveUntil(
        Home.routeName, (Route<dynamic> route) => false));
  }
}
