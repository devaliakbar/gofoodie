import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';

class LoginFoodImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width(100),
      height: SizeConfig.heightWithoutSafeArea(50),
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            SizeConfig.width(35),
          ),
          bottomRight: Radius.circular(
            SizeConfig.width(35),
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: SizeConfig.heightWithoutSafeArea(1.5),
            ),
            height: SizeConfig.heightWithoutSafeArea(28),
            child: Image.asset(
              AppImages.food,
            ),
          )
        ],
      ),
    );
  }
}
