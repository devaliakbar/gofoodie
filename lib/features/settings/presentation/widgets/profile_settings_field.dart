import 'package:flutter/material.dart';

import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class ProfileSettingsField extends StatelessWidget {
  final String title;
  final String value;
  final Function onEditClick;

  ProfileSettingsField(
      {@required this.title, @required this.value, @required this.onEditClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: SizeConfig.height(6.5),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NormalText(
                  title,
                  color: AppColors.blue,
                  size: FontSizes.fontSizeXS,
                ),
                NormalText(
                  value,
                  color: AppColors.black,
                  size: FontSizes.fontSizeBSM,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onEditClick,
            child: Container(
              height: SizeConfig.height(5),
              width: SizeConfig.height(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: Icon(
                Icons.edit_outlined,
                color: AppColors.red,
                size: IconSizes.iconSizeM,
              ),
            ),
          )
        ],
      ),
    );
  }
}
