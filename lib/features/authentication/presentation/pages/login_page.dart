import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/features/authentication/presentation/widgets/login_bottom_controls.dart';

import 'package:gofoodie/features/authentication/presentation/widgets/login_food_image.dart';
import 'package:gofoodie/features/authentication/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.heightWithoutSafeArea(100),
          child: Stack(
            children: [
              LoginFoodImage(),
              LoginForm(),
              LoginBottomControls(),
            ],
          ),
        ),
      ),
    );
  }
}
