import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';

class VendorHeaderActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.blue,
                  size: IconSizes.iconSizeM,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: Icon(
                  Icons.card_travel,
                  color: AppColors.blue,
                  size: IconSizes.iconSizeM,
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.width(5),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: Icon(
                  Icons.search,
                  color: AppColors.blue,
                  size: IconSizes.iconSizeM,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
