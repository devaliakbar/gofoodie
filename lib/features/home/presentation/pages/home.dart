import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/features/home/presentation/widgets/best_restaurant.dart';

import 'package:gofoodie/features/home/presentation/widgets/home_list_view.dart';
import 'package:gofoodie/features/home/presentation/widgets/home_appbar.dart';
import 'package:gofoodie/features/home/presentation/widgets/home_header.dart';

class Home extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(),
              SizedBox(
                height: SizeConfig.height(4),
              ),
              HomeListView(title: AppString.availableOfferRightNow),
              SizedBox(
                height: SizeConfig.height(3),
              ),
              HomeListView(title: AppString.browseByCategory),
              SizedBox(
                height: SizeConfig.height(3),
              ),
              BestRestaurant(),
              SizedBox(
                height: SizeConfig.height(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
