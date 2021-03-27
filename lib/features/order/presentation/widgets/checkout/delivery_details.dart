import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class DeliveryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.height(1),
        horizontal: SizeConfig.width(2),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          SizeConfig.width(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                NormalText(
                  "Personal Details",
                  color: AppColors.black,
                  boldText: true,
                ),
                SizedBox(
                  width: SizeConfig.width(1),
                ),
                NormalText(
                  "(Edit)",
                  color: AppColors.red,
                  size: FontSizes.fontSizeXS,
                )
              ],
            ),
            NormalText(
              "Ali Akbar P A",
              color: AppColors.black,
            ),
            NormalText(
              "+91 8547938611",
              color: AppColors.black,
            ),
            SizedBox(
              height: SizeConfig.height(1),
            ),
            Row(
              children: [
                NormalText(
                  "Delivery Address",
                  color: AppColors.black,
                  boldText: true,
                ),
                SizedBox(
                  width: SizeConfig.width(1),
                ),
                NormalText(
                  "(Edit)",
                  color: AppColors.red,
                  size: FontSizes.fontSizeXS,
                )
              ],
            ),
            NormalText(
              "123 Main Street, New York, NY 10030",
              color: AppColors.black,
              truncate: true,
            ),
            SizedBox(
              height: SizeConfig.height(1),
            ),
            NormalText(
              "Order Notes",
              color: AppColors.black,
              boldText: true,
            ),
            SizedBox(
              height: SizeConfig.height(1),
            ),
            CustomTextField(
              label: "Order Note",
              borderRadius: SizeConfig.width(2),
              maxLine: 3,
            )
          ],
        ),
      ),
    );
  }
}
