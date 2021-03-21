import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class VendorInfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.width(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalText(
            "Restaurant Info",
            size: FontSizes.fontSizeL,
            boldText: true,
          ),
          SizedBox(
            height: SizeConfig.height(1),
          ),
          NormalText("Poké, Healthy Food"),
          SizedBox(
            height: SizeConfig.height(1),
          ),
          NormalText("Dubai"),
          SizedBox(
            height: SizeConfig.height(1),
          ),
          Row(
            children: [
              Icon(
                Icons.phone,
                color: AppColors.red,
                size: IconSizes.iconSizeM,
              ),
              SizedBox(
                width: SizeConfig.width(3),
              ),
              NormalText(
                "+12 42449345",
                color: AppColors.black,
              )
            ],
          ),
          SizedBox(
            height: SizeConfig.height(1),
          ),
          Row(
            children: [
              Icon(
                Icons.mail,
                color: AppColors.red,
                size: IconSizes.iconSizeM,
              ),
              SizedBox(
                width: SizeConfig.width(3),
              ),
              NormalText(
                "info@soulbowl.com",
                color: AppColors.black,
              )
            ],
          )
        ],
      ),
    );
  }
}
