import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/features/welcome/presentation/blocs/splash_screen/splash_screen_bloc.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    BlocProvider.of<SplashScreenBloc>(context).add(
      SplashScreenGetRouteEvent(),
    );

    return BlocConsumer<SplashScreenBloc, SplashScreenState>(
      listener: (context, state) {
        print("Splash Screen State Changed");

        if (state is SplashScreenExitState) {
          Future.delayed(
              const Duration(seconds: 1),
              () => Navigator.of(context).pushNamedAndRemoveUntil(
                  state.routeName, (Route<dynamic> route) => false));
        } else if (state is SplashScreenErrorState) {
          ShowToast(state.message);
        }
      },
      buildWhen: (previous, current) {
        return false;
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.width(6)),
            child: Center(
              child: Image.asset(AppImages.splashScreen),
            ),
          ),
        );
      },
    );
  }
}
