import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class MyOrderContent extends StatelessWidget {
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
              Padding(
                padding: EdgeInsets.only(
                  bottom: SizeConfig.height(1),
                ),
                child: NormalText(
                  "2 * Maggi",
                  size: FontSizes.fontSizeBSM,
                  color: AppColors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: SizeConfig.height(1),
                ),
                child: NormalText(
                  "2 * Maggi",
                  size: FontSizes.fontSizeBSM,
                  color: AppColors.black,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
