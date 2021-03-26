import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class DeliveryModeSwitch extends StatefulWidget {
  // final bool value;
  // final ValueChanged<bool> onChanged;

  // CustomSwitch({@required this.value, @required this.onChanged});

  @override
  _DeliveryModeSwitchState createState() => _DeliveryModeSwitchState();
}

class _DeliveryModeSwitchState extends State<DeliveryModeSwitch> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.account_balance_outlined,
          color: AppColors.green,
          size: IconSizes.iconSizeM,
        ),
        SizedBox(
          width: SizeConfig.width(5),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              value = false;
            });
          },
          child: NormalText(
            "Pick Up",
            color: AppColors.black,
            size: FontSizes.fontSizeS,
            boldText: true,
          ),
        ),
        SizedBox(
          width: SizeConfig.width(3),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              value = !value;
            });
          },
          child: Container(
            width: SizeConfig.height(5),
            height: SizeConfig.height(2.1),
            decoration: BoxDecoration(
              border: Border.all(
                color: value ? AppColors.red : AppColors.black,
                width: SizeConfig.height(0.25),
              ),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Container(
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: SizeConfig.height(0.5)),
                width: SizeConfig.height(1),
                height: SizeConfig.height(1),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: value ? AppColors.red : AppColors.black,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.width(3),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              value = true;
            });
          },
          child: NormalText(
            "Delivery",
            color: AppColors.red,
            size: FontSizes.fontSizeS,
            boldText: true,
          ),
        ),
      ],
    );
  }
}
