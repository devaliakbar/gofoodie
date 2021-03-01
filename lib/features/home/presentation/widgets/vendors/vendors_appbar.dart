import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/home/presentation/widgets/vendors/filter.dart';

class VendorsAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: AppColors.black),
      title: NormalText(
        "Vendors",
        color: AppColors.black,
        boldText: true,
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  showDialog(context: context, child: VendorsFilter());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  child: Icon(
                    Icons.filter_alt_outlined,
                    color: AppColors.blue,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}
