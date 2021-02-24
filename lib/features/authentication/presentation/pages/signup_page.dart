import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/utils/utils.dart';
import 'package:gofoodie/features/authentication/presentation/widgets/auth_bottom_controls.dart';

import 'package:gofoodie/features/authentication/presentation/widgets/login_food_image.dart';
import 'package:gofoodie/features/authentication/presentation/widgets/signup_form.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/signup_page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.heightWithoutSafeArea(100),
          child: Stack(
            children: [
              LoginFoodImage(),
              Container(
                margin: EdgeInsets.only(top: SizeConfig.height(10)),
                child: Form(
                    key: _formKey,
                    child: SignUpForm(
                      fullNameController: fullNameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      rePasswordController: rePasswordController,
                      nameValidator: onValidateName,
                      emailValidator: onValidateEmail,
                      passwordValidator: onValidatePassword,
                      rePasswordValidator: onValidateRePassword,
                    )),
              ),
              AuthBottomControls(
                buttonText: AppString.signUp,
                onButtonClick: onSave,
                bottomText: AppString.alreadyHaveAnAccount,
                bottomClickableText: AppString.login,
                bottomOnClick: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String onValidateName(String value) {
    if (value == "") {
      return AppString.fieldEmpty;
    }
    return null;
  }

  String onValidateEmail(String value) {
    if (value == "") {
      return AppString.fieldEmpty;
    }
    if (!Utils.isEmail(value)) {
      return AppString.enterValidEmail;
    }
    return null;
  }

  String onValidatePassword(String value) {
    if (value == "") {
      return AppString.fieldEmpty;
    }

    if (value.length < 6) {
      return AppString.passwordLength;
    }

    return null;
  }

  String onValidateRePassword(String value) {
    if (value == "") {
      return AppString.fieldEmpty;
    }

    if (value.trim() != passwordController.text.trim()) {
      return AppString.passwordNoMatch;
    }

    return null;
  }

  void onSave() {
    FocusScope.of(context).requestFocus(new FocusNode());

    if (!_formKey.currentState.validate()) {
      print('Validate Triggered');
      return;
    }
    _formKey.currentState.save();
  }
}
