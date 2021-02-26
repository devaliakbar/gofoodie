import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class CustomButton extends StatelessWidget {
  final Function onClick;
  final String title;
  final double width;
  final bool isLoading;

  CustomButton(
      {@required this.onClick,
      @required this.title,
      this.isLoading = false,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: SizeConfig.height(6.5),
      child: RaisedButton(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.width(50)),
        ),
        color: AppColors.red,
        disabledColor: AppColors.red,
        child: isLoading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : NormalText(
                title,
                color: Colors.white,
                boldText: true,
              ),
        onPressed: isLoading ? null : onClick,
      ),
    );
  }
}
