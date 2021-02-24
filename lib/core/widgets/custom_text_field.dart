import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/ensure_visible.dart';
import 'package:gofoodie/core/services/size_config.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obsecure;

  CustomTextField({@required this.label, this.obsecure = false});

  @override
  Widget build(BuildContext context) {
    return EnsureVisibleWhenFocused(
      child: TextFormField(
        obscureText: obsecure,
        cursorColor: AppColors.lightBlack,
        style: TextStyle(
            fontSize: FontSizes.fontSizeM, color: AppColors.lightBlack),
        decoration: new InputDecoration(
          filled: true,
          isDense: true,
          fillColor: Colors.white,
          labelText: label,
          labelStyle: TextStyle(color: AppColors.lightBlack),
          contentPadding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width(5),
            vertical: SizeConfig.width(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightBlack, width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.width(50)),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.lightBlack.withOpacity(0.5), width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.width(50)),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightBlack, width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.width(50)),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.width(50)),
            ),
          ),
        ),
      ),
      focusNode: FocusNode(),
    );
  }
}
