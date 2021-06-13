import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/services/vibrate.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class QuantityButton extends StatelessWidget {
  final int qty;
  final Function onIncrement;
  final Function onDecrement;

  QuantityButton(
      {@required this.qty,
      @required this.onIncrement,
      @required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    if (qty == 0) {
      return InkWell(
        onTap: () {
          AppVibration();

          onIncrement();
        },
        child: Card(
          margin: EdgeInsets.all(0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.height(1)),
            height: SizeConfig.height(3),
            width: SizeConfig.height(9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NormalText(
                  "ADD",
                  color: AppColors.green,
                  boldText: true,
                  size: FontSizes.fontSizeXS,
                ),
                Icon(
                  Icons.add,
                  color: AppColors.green,
                  size: IconSizes.iconSizeXXS,
                )
              ],
            ),
          ),
        ),
      );
    }

    return Card(
      margin: EdgeInsets.all(0),
      child: Container(
        height: SizeConfig.height(3),
        width: SizeConfig.height(9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  AppVibration();
                  onDecrement();
                },
                child: Center(
                  child: Icon(
                    Icons.remove,
                    color: AppColors.green,
                    size: IconSizes.iconSizeXXS,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: NormalText(
                  "$qty",
                  color: AppColors.green,
                  size: FontSizes.fontSizeXS,
                  truncate: true,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  AppVibration();
                  onIncrement();
                },
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: AppColors.green,
                    size: IconSizes.iconSizeXXS,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
