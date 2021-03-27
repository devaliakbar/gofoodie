import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class OrderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
          left: SizeConfig.width(2), right: SizeConfig.width(2)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          SizeConfig.width(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NormalText(
              "Your Order",
              color: AppColors.black,
              boldText: true,
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NormalText(
                        "Arabian Honey Cake",
                        color: AppColors.black,
                      ),
                      NormalText(
                        "1  *  ₹10.00",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: SizeConfig.width(3),
                ),
                NormalText(
                  "₹10.00",
                  boldText: true,
                )
              ],
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NormalText(
                        "Arabian Honey Cake",
                        color: AppColors.black,
                      ),
                      NormalText(
                        "1  *  ₹10.00",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: SizeConfig.width(3),
                ),
                NormalText(
                  "₹10.00",
                  boldText: true,
                )
              ],
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NormalText(
                        "Arabian Honey Cake",
                        color: AppColors.black,
                      ),
                      NormalText(
                        "1  *  ₹10.00",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: SizeConfig.width(3),
                ),
                NormalText(
                  "₹10.00",
                  boldText: true,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
