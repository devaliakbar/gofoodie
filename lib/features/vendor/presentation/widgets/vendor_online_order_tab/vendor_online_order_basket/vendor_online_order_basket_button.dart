import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class VendorOnlineOrderBasketButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.width(5),
      ),
      height: SizeConfig.height(7.5),
      child: Material(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(
          SizeConfig.height(1),
        ),
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.red.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(
              SizeConfig.height(1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalText(
                      "₹1660",
                      color: Colors.white,
                      boldText: true,
                    ),
                    NormalText(
                      "TOTAL",
                      color: Colors.white,
                      size: FontSizes.fontSizeS,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NormalText(
                      "Place Order",
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.arrow_right,
                      size: IconSizes.iconSizeXXS,
                      color: Colors.white,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
