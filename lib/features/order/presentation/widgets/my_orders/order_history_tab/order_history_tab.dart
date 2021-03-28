import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/my_order_content.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/order_divider.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/order_history_tab/order_rating.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/order_history_tab/order_status.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/order_vendor_info.dart';

class OrderHistoryTab extends StatelessWidget {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderVendorInfo(),
                OrderDivider(),
                OrderStatus(),
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
                OrderRating()
              ],
            ),
          );
        },
      ),
    );
  }
}
