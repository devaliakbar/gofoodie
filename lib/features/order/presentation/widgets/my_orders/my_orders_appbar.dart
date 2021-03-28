import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class MyOrdersAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: NormalText(
        "My Orders",
        color: AppColors.black,
        boldText: true,
      ),
      iconTheme: IconThemeData(color: AppColors.black),
      bottom: TabBar(
        unselectedLabelColor: AppColors.lightBlack,
        indicatorColor: AppColors.red,
        labelColor: AppColors.red,
        tabs: [
          Tab(
            child: Text(
              "Current Order",
              style: TextStyle(fontSize: FontSizes.fontSizeM),
            ),
          ),
          Tab(
            child: Text(
              "Order History",
              style: TextStyle(fontSize: FontSizes.fontSizeM),
            ),
          ),
          Tab(
            child: Text(
              "Monthly Order",
              style: TextStyle(fontSize: FontSizes.fontSizeM),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      new Size.fromHeight(AppBar().preferredSize.height * 2);
}
