import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_button.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';

class CouponApply extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: "Coupon Code",
            borderRadius: SizeConfig.width(2),
          ),
        ),
        SizedBox(
          width: SizeConfig.width(3),
        ),
        CustomButton(
          onClick: () {},
          title: "Apply",
          borderRadius: SizeConfig.width(2),
        )
      ],
    );
  }
}
