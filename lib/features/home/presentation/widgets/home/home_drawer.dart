import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/local_storage/local_storage.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/authentication/presentation/pages/login_page.dart';
import 'package:gofoodie/features/home/presentation/widgets/home/drawer_user_details.dart';
import 'package:gofoodie/features/settings/presentation/pages/profile.dart';
import 'package:gofoodie/injection_container.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerUserDetails(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: IconSizes.iconSizeM,
                          color: AppColors.black,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        NormalText(
                          "My Orders",
                          color: AppColors.black,
                        )
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_border_rounded,
                          size: IconSizes.iconSizeM,
                          color: AppColors.black,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        NormalText(
                          "Ratings & Review",
                          color: AppColors.black,
                        )
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, Profile.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          size: IconSizes.iconSizeM,
                          color: AppColors.black,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        NormalText(
                          AppString.profileSettings,
                          color: AppColors.black,
                        )
                      ],
                    ),
                  )
                ],
              ),
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
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}
