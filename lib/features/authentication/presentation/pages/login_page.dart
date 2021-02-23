import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/font_sizes.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_button.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

import 'package:gofoodie/features/authentication/presentation/widgets/food_image.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FoodImage(),

          //CENTER
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: SizeConfig.height(1),
                ),
                alignment: Alignment.center,
                child: NormalText(
                  tr("login").toUpperCase(),
                  boldText: true,
                  size: FontSizes.fontSizeL,
                ),
              ),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.width(5)),
                  ),
                ),
                child: Container(
                  width: SizeConfig.width(80),
                  padding: EdgeInsets.all(
                    SizeConfig.width(10),
                  ),
                  child: Column(
                    children: [
                      CustomTextField(
                        label: tr("email"),
                      ),
                      SizedBox(
                        height: SizeConfig.height(2),
                      ),
                      CustomTextField(
                        label: tr("password"),
                        obsecure: true,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.height(3.5),
                ),
                alignment: Alignment.center,
                child: NormalText(
                  tr("forgot_password"),
                  boldText: true,
                ),
              ),
            ],
          ),

          //BOTTOM
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    onClick: () {},
                    title: tr("login"),
                    width: SizeConfig.width(70),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: SizeConfig.height(3.5)),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NormalText(
                            tr("dont_you_have_account"),
                          ),
                          NormalText(
                            " " + tr("sign_up"),
                            boldText: true,
                          ),
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
