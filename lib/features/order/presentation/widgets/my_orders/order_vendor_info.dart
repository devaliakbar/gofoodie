import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/image_from_network.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/order/data/models/order_model.dart';

class OrderVendorInfo extends StatelessWidget {
  final OrderModel orderModel;

  OrderVendorInfo({@required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.height(2),
        horizontal: SizeConfig.width(3),
      ),
      child: Row(
        children: [
          SizedBox(
            width: SizeConfig.height(7),
            height: SizeConfig.height(7),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                SizeConfig.height(0.5),
              ),
              child: ImageFromNetwork(
                imageUrl: orderModel.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: SizeConfig.width(2.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: NormalText(
                          orderModel.name,
                          truncate: true,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.height(2),
                      ),
                      NormalText(
                        "Total AED ${orderModel.total}",
                        truncate: true,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  NormalText(
                    orderModel.address ?? "",
                    truncate: true,
                    size: FontSizes.fontSizeBSM,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
