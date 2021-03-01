import 'package:flutter/material.dart';
import 'package:gofoodie/core/animation/custom_animation.dart';
import 'package:gofoodie/core/res/app_resources.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAnimation(
      opacityEffect: true,
      animationDuration: Duration(milliseconds: 400),
      customAnimationType: CustomAnimationType.topToBottom,
      widget: AppBar(
        backgroundColor: AppColors.lightGrey,
        elevation: 0,
        centerTitle: false,
        title: Container(
          height: AppBar().preferredSize.height - 7,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Image.asset(
            AppImages.splashScreen,
            fit: BoxFit.fitHeight,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: Icon(
                      Icons.menu,
                      color: AppColors.blue,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}
