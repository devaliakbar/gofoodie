import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/my_order_content.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/order_divider.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/order_vendor_info.dart';

class MonthlyOrderTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.height(2),
      ),
      child: ListView.builder(
        itemCount: 5,
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
                OrderVendorInfo(),
                OrderDivider(),
                MyOrderContent(),
                Container(
                  alignment: Alignment.topLeft,
                  padding:
                      EdgeInsets.symmetric(horizontal: SizeConfig.width(3)),
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
                    "Feb 18, 2021 AT 03 : 00 PM",
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
                      onPressed: () {},
                      child: NormalText(
                        "Cancel Order",
                        color: AppColors.red,
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
}
