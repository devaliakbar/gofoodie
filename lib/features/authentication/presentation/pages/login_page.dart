import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/animation/custom_animation.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/utils/utils.dart';
import 'package:gofoodie/features/authentication/presentation/blocs/login/login_bloc.dart';
import 'package:gofoodie/features/authentication/presentation/pages/signup_page.dart';
import 'package:gofoodie/features/authentication/presentation/widgets/auth_bottom_controls.dart';

import 'package:gofoodie/features/authentication/presentation/widgets/login_food_image.dart';
import 'package:gofoodie/features/authentication/presentation/widgets/login_form.dart';
import 'package:gofoodie/features/home/presentation/pages/home.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// [_animationController1] is for TopImage and red background
  AnimationController _animationController1;

  /// [_animationController2] is for Form,Button and bottom text
  AnimationController _animationController2;

  @override
  void initState() {
    super.initState();

    _animationController1 =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this);

    _animationController2 =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

    _animationController1.dispose();
    _animationController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.heightWithoutSafeArea(100),
          child: Stack(
            children: [
              CustomAnimation(
                animationController: _animationController1,
                opacityEnable: true,
                widget: LoginFoodImage(),
                customAnimationType: CustomAnimationType.topToBottom,
                onAnimationComplete: () {
                  _animationController2.forward();
                },
              ),
              CustomAnimation(
                elasticEffect: true,
                animationController: _animationController2,
                playAnimation: false,
                customAnimationType: CustomAnimationType.bottomToTop,
                widget: Form(
                  key: _formKey,
                  child: LoginForm(
                    emailController: emailController,
                    passwordController: passwordController,
                    emailValidator: onValidateEmail,
                    passwordValidator: onValidatePassword,
                  ),
                ),
              ),
              BlocConsumer<LoginBloc, LoginState>(
                builder: (context, state) {
                  return CustomAnimation(
                    elasticEffect: true,
                    animationController: _animationController2,
                    playAnimation: false,
                    customAnimationType: CustomAnimationType.bottomToTop,
                    widget: AuthBottomControls(
                      buttonText: AppString.login,
                      onButtonClick: onSave,
                      bottomText: AppString.dontYouHaveAccount,
                      bottomClickableText: AppString.signUp,
                      bottomOnClick: () async {
                        _animationController2.reverse().whenComplete(() async {
                          await Navigator.pushNamed(
                              context, SignUpPage.routeName);
                          _animationController2.forward();
                        });
                      },
                      isLoading: state is LoginLoadingState,
                    ),
                  );
                },
                listener: (context, state) {
                  print("Login Screen State Changed");

                  if (state is LoginSuccessState) {
                    _animationController2.reverse().whenComplete(() =>
                        _animationController1.reverse().whenComplete(() =>
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                Home.routeName,
                                (Route<dynamic> route) => false)));
                  } else if (state is LoginErrorState) {
                    ShowToast(state.message);
                  }
                },
                buildWhen: (previous, current) {
                  if (current is LoginLoadingState ||
                      current is LoginErrorState) {
                    return true;
                  }
                  return false;
                },
              ),
            ],
          ),
        ),
      ),
    );
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

    if (value.length < 8) {
      return AppString.passwordLength;
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

    BlocProvider.of<LoginBloc>(context).add(
      LoginUserEvent(
          email: emailController.text.trim(),
          password: passwordController.text.trim()),
    );
  }
}
