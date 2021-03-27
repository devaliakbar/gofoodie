import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';

class VendorHeaderActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
