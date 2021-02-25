import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_button.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class AuthBottomControls extends StatelessWidget {
  final String buttonText;
  final Function onButtonClick;

  final String bottomText;
  final String bottomClickableText;
  final Function bottomOnClick;

  final bool isLoading;

  AuthBottomControls(
      {@required this.buttonText,
      @required this.onButtonClick,
      @required this.bottomText,
      @required this.bottomClickableText,
      @required this.bottomOnClick,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              onClick: onButtonClick,
              title: buttonText,
              isLoading: isLoading,
              width: SizeConfig.width(70),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.height(3.5)),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NormalText(
                    bottomText,
                  ),
                  InkWell(
                    onTap: bottomOnClick,
                    child: NormalText(
                      " " + bottomClickableText,
                      boldText: true,
                    ),
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
