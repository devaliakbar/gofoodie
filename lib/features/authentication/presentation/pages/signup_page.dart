import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/custom_animation/custom_animation.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/utils/utils.dart';
import 'package:gofoodie/features/authentication/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:gofoodie/features/authentication/presentation/widgets/auth_bottom_controls.dart';

import 'package:gofoodie/features/authentication/presentation/widgets/login_food_image.dart';
import 'package:gofoodie/features/authentication/presentation/widgets/signup_form.dart';
import 'package:gofoodie/features/home/presentation/pages/home.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/signup_page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();

    _animationController.dispose();
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
              CustomAnimation(
                animationController: _animationController,
                customAnimationType: CustomAnimationType.bottomToTop,
                widget: Form(
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
                  ),
                ),
              ),
              BlocConsumer<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  return CustomAnimation(
                    animationController: _animationController,
                    customAnimationType: CustomAnimationType.bottomToTop,
                    widget: AuthBottomControls(
                      buttonText: AppString.signUp,
                      onButtonClick: onSave,
                      bottomText: AppString.alreadyHaveAnAccount,
                      bottomClickableText: AppString.login,
                      bottomOnClick: () {
                        _animationController
                            .reverse()
                            .whenComplete(() => Navigator.pop(context));
                      },
                      isLoading: state is SignUpLoadingState,
                    ),
                  );
                },
                listener: (context, state) {
                  print("SignUp Screen State Changed");

                  if (state is SignUpSuccessState) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Home.routeName, (Route<dynamic> route) => false);
                  } else if (state is SignUpErrorState) {
                    ShowToast(state.message);
                  }
                },
                buildWhen: (previous, current) {
                  if (current is SignUpLoadingState ||
                      current is SignUpErrorState) {
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

    if (value.length < 8) {
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

    BlocProvider.of<SignUpBloc>(context).add(
      SignUpUserEvent(
          fullName: fullNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim()),
    );
  }
}
