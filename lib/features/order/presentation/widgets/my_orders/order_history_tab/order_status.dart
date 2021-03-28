import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class OrderStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        margin: EdgeInsets.only(
          left: SizeConfig.width(3),
          top: SizeConfig.height(2),
        ),
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.height(0.3),
            horizontal: SizeConfig.width(1.5)),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: AppColors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(
              SizeConfig.height(0.5),
            )),
        child: NormalText(
          "Delivered",
          color: AppColors.green,
        ),
      ),
    );
  }
}
