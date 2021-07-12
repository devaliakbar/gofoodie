import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/order/data/models/order_model.dart';

class MyOrderContent extends StatelessWidget {
  final OrderModel order;

  MyOrderContent({@required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width(3),
            vertical: SizeConfig.height(1),
          ),
          child: NormalText(
            "Items",
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width(3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int index = 0; index < order.orderItems.length; index++)
                Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeConfig.height(1),
                  ),
                  child: NormalText(
                    "${order.orderItems[index].quantity} * ${order.orderItems[index].productName}",
                    size: FontSizes.fontSizeBSM,
                    color: AppColors.black,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
