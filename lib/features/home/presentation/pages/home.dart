import 'package:flutter/material.dart';
import 'package:gofoodie/core/animation/custom_animation.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/loading_view.dart';
import 'package:gofoodie/features/home/presentation/widgets/best_restaurant.dart';

import 'package:gofoodie/features/home/presentation/widgets/home_list_view.dart';
import 'package:gofoodie/features/home/presentation/widgets/home_appbar.dart';
import 'package:gofoodie/features/home/presentation/widgets/home_header.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  /// [animationController] is for 3 Cards
  AnimationController animationController;

  /// [animationController2] is for Body
  AnimationController animationController2;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(milliseconds: 550), vsync: this);

    animationController2 =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController2.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAnimation(
                customAnimationType: CustomAnimationType.topToBottom,
                animationDuration: Duration(milliseconds: 400),
                opacityEffect: true,
                onAnimationComplete: () {
                  animationController.forward();
                },
                widget: HomeHeader(
                  animationController: animationController,
                ),
              ),
              CustomAnimation(
                animationController: animationController2,
                opacityEffect: true,
                playAnimation: false,
                customAnimationType: CustomAnimationType.bottomToTop,
                widget: Container(
                  height: SizeConfig.height(50),
                  child: LoadingView(),
                ),
              ),

              // Column(
              //               children: [
              //                 SizedBox(
              //                   height: SizeConfig.height(3),
              //                 ),
              //                 HomeListView(title: AppString.availableOfferRightNow),
              //                 SizedBox(
              //                   height: SizeConfig.height(3),
              //                 ),
              //                 HomeListView(title: AppString.browseByCategory),
              //                 SizedBox(
              //                   height: SizeConfig.height(3),
              //                 ),
              //                 BestRestaurant(),
              //                 SizedBox(
              //                   height: SizeConfig.height(3),
              //                 ),
              //               ],
              //             )
            ],
          ),
        ),
      ),
    );
  }
}
