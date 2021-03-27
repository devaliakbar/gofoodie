import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class SuccessDialogue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(15.0),
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          height: 250.0,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: Material(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outlined,
                        size: IconSizes.successIconSize,
                        color: AppColors.red,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      NormalText(
                        "Order Placed Successfully!",
                        size: FontSizes.fontSizeL,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 1,
                  child: IconButton(
                    icon: Icon(
                      Icons.close_outlined,
                      color: AppColors.red,
                      size: IconSizes.iconSizeM,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
