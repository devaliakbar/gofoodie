import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/services/vibrate.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class QuantityButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppVibration();
      },
      child: Card(
        margin: EdgeInsets.all(0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.height(1)),
          height: SizeConfig.height(3),
          width: SizeConfig.height(9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NormalText(
                "ADD",
                color: AppColors.green,
                boldText: true,
                size: FontSizes.fontSizeXS,
              ),
              Icon(
                Icons.add,
                color: AppColors.green,
                size: IconSizes.iconSizeXXS,
              )
            ],
          ),
        ),
      ),
    );
  }
}
