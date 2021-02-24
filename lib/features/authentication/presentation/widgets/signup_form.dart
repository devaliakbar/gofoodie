import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;

  final FormFieldValidator<String> nameValidator;
  final FormFieldValidator<String> emailValidator;
  final FormFieldValidator<String> passwordValidator;
  final FormFieldValidator<String> rePasswordValidator;

  SignUpForm(
      {@required this.fullNameController,
      @required this.emailController,
      @required this.passwordController,
      @required this.rePasswordController,
      @required this.nameValidator,
      @required this.emailValidator,
      @required this.passwordValidator,
      @required this.rePasswordValidator});

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
                    validator: nameValidator,
                  ),
                  SizedBox(
                    height: SizeConfig.height(2),
                  ),
                  CustomTextField(
                    label: AppString.email,
                    controller: emailController,
                    validator: emailValidator,
                  ),
                  SizedBox(
                    height: SizeConfig.height(2),
                  ),
                  CustomTextField(
                    label: AppString.password,
                    controller: passwordController,
                    obsecure: true,
                    validator: passwordValidator,
                  ),
                  SizedBox(
                    height: SizeConfig.height(2),
                  ),
                  CustomTextField(
                    label: AppString.password,
                    controller: rePasswordController,
                    obsecure: true,
                    validator: rePasswordValidator,
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
