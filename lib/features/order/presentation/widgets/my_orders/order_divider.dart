import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';

class OrderDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height(0.15),
      color: AppColors.lightBlack.withOpacity(0.3),
    );
  }
}
