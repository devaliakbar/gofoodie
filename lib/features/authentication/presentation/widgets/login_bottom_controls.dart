import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_string.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_button.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class LoginBottomControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              onClick: () {},
              title: AppString.login,
              width: SizeConfig.width(70),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.height(3.5)),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NormalText(
                    AppString.dontYouHaveAccount,
                  ),
                  NormalText(
                    " " + AppString.signUp,
                    boldText: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
