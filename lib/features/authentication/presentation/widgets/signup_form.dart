import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;

  SignUpForm(
      {@required this.fullNameController,
      @required this.emailController,
      @required this.passwordController,
      @required this.rePasswordController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Card(
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
                    label: AppString.fullName,
                    controller: fullNameController,
                  ),
                  SizedBox(
                    height: SizeConfig.height(2),
                  ),
                  CustomTextField(
                    label: AppString.email,
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
                  SizedBox(
                    height: SizeConfig.height(2),
                  ),
                  CustomTextField(
                    label: AppString.password,
                    controller: rePasswordController,
                    obsecure: true,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
