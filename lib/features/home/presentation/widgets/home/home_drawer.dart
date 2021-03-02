import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/local_storage/local_storage.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/authentication/presentation/pages/login_page.dart';
import 'package:gofoodie/features/settings/presentation/pages/profile.dart';
import 'package:gofoodie/injection_container.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              NormalText(
                "Ali Akbar",
                boldText: true,
                color: AppColors.black,
                size: FontSizes.fontSizeL,
              ),
              Divider(
                color: AppColors.lightBlack,
              ),
              Expanded(
                child: ListView(
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, Profile.routeName);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_outline_rounded,
                            size: IconSizes.iconSizeM,
                            color: AppColors.lightBlack,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          NormalText(
                            AppString.myProfile,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: AppColors.lightBlack,
              ),
              FlatButton(
                onPressed: () {
                  sl<LocalStorage>().clearAllLocalData();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginPage.routeName, (Route<dynamic> route) => false);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.power_settings_new_rounded,
                      size: IconSizes.iconSizeM,
                      color: AppColors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    NormalText(
                      AppString.logout,
                      color: AppColors.black,
                      boldText: true,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
