import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginForm(
      {@required this.emailController, @required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: SizeConfig.height(1),
          ),
          alignment: Alignment.center,
          child: NormalText(
            AppString.login.toUpperCase(),
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
              SizeConfig.width(9),
            ),
            child: Column(
              children: [
                CustomTextField(
                  label: AppString.email,
                  inputType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                SizedBox(
                  height: SizeConfig.height(2),
                ),
                CustomTextField(
                  label: AppString.password,
                  controller: passwordController,
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
            AppString.forgotPassword,
            boldText: true,
          ),
        ),
      ],
    );
  }
}
