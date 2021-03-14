import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/animation/custom_animation.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/loading_view.dart';
import 'package:gofoodie/features/home/presentation/blocs/home/home_bloc.dart';
import 'package:gofoodie/features/home/presentation/widgets/home/home_best_restaurant.dart';
import 'package:gofoodie/features/home/presentation/widgets/home/home_drawer.dart';

import 'package:gofoodie/features/home/presentation/widgets/home/home_list_view.dart';
import 'package:gofoodie/features/home/presentation/widgets/home/home_appbar.dart';
import 'package:gofoodie/features/home/presentation/widgets/home/home_header.dart';

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

    BlocProvider.of<HomeBloc>(context).add(
      GetHomeDataEvent(),
    );

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
      appBar: HomeAppBar(),
      endDrawer: HomeDrawer(),
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
                widget: BlocConsumer<HomeBloc, HomeState>(
                  listener: (context, state) {
                    print("Home Screen State Changed");

                    if (state is HomeErrorState) {
                      ShowToast(state.message);
                    }
                  },
                  buildWhen: (previous, current) {
                    if (current is HomeErrorState) {
                      return false;
                    }

                    return true;
                  },
                  builder: (context, state) {
                    if (state is HomeLoadedState) {
                      return Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.height(3),
                          ),
                          HomeListView(
                            title: AppString.availableOfferRightNow,
                            categories: state.homeData.offeredRestaurants,
                            isRestaurant: true,
                          ),
                          SizedBox(
                            height: SizeConfig.height(3),
                          ),
                          HomeListView(
                            title: AppString.browseByCategory,
                            categories: state.homeData.categories,
                          ),
                          SizedBox(
                            height: SizeConfig.height(3),
                          ),
                          HomeBestRestaurant(
                            categories: state.homeData.bestRestaurants,
                          ),
                          SizedBox(
                            height: SizeConfig.height(3),
                          ),
                        ],
                      );
                    }
                    return Container(
                      height: SizeConfig.height(50),
                      child: LoadingView(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
