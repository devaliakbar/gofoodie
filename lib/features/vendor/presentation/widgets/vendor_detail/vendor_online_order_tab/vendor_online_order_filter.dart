import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class VendorOnlineOrderFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        top: SizeConfig.height(2),
      ),
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.width(1),
            ),
            child: NormalText(
              "All",
              color: AppColors.red,
              size: FontSizes.fontSizeS,
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.height(0.5),
            ),
            child: NormalText(
              "Break Fast",
              color: AppColors.black,
              size: FontSizes.fontSizeS,
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.height(0.5),
            ),
            child: NormalText(
              "Combo Meals",
              color: AppColors.black,
              size: FontSizes.fontSizeS,
            ),
          ),
        ),
      ],
    );
  }
}
