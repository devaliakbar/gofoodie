import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/features/authentication/presentation/pages/signup_page.dart';
import 'package:gofoodie/features/authentication/presentation/widgets/auth_bottom_controls.dart';

import 'package:gofoodie/features/authentication/presentation/widgets/login_food_image.dart';
import 'package:gofoodie/features/authentication/presentation/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
              LoginForm(
                emailController: emailController,
                passwordController: passwordController,
              ),
              AuthBottomControls(
                buttonText: AppString.login,
                onButtonClick: () {},
                bottomText: AppString.dontYouHaveAccount,
                bottomClickableText: AppString.signUp,
                bottomOnClick: () {
                  Navigator.pushNamed(context, SignUpPage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
