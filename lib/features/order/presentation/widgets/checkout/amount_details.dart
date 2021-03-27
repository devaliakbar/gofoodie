import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_button.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/order/presentation/widgets/checkout/coupon_apply.dart';

class AmountDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.height(1),
      ),
      padding: EdgeInsets.all(
        SizeConfig.width(3),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.lightGrey,
            width: SizeConfig.height(0.3),
          ),
        ),
      ),
      child: Column(
        children: [
          CouponApply(),
          SizedBox(
            height: SizeConfig.height(2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NormalText(
                "SubTotal",
                color: AppColors.black,
              ),
              NormalText("₹530.00", color: AppColors.black),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NormalText(
                    "Coupon Offer",
                    color: AppColors.red,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: SizeConfig.width(1),
                    ),
                    padding: EdgeInsets.all(
                      SizeConfig.width(0.2),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.red),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: FontSizes.fontSizeS,
                    ),
                  ),
                ],
              ),
              NormalText("- ₹10.00", color: AppColors.red),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NormalText(
                "Delivery Charge",
              ),
              NormalText(
                "17.00",
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NormalText(
                "Taxes",
              ),
              NormalText(
                "26.00",
              ),
            ],
          ),
          Divider(
            thickness: SizeConfig.height(0.2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NormalText(
                "Total",
                color: AppColors.black,
                boldText: true,
              ),
              NormalText(
                "₹563.50",
                color: AppColors.black,
                boldText: true,
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.height(2),
          ),
          CustomButton(
            onClick: () {},
            title: "Select Payment Method",
            width: double.infinity,
            borderRadius: SizeConfig.width(2),
          )
        ],
      ),
    );
  }
}
