import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/profile/presentation/widgets/my_ratings/rating_tile.dart';

class MyRatings extends StatelessWidget {
  static const String routeName = '/my_ratings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.black),
        title: NormalText(
          "Ratings & Review",
          color: AppColors.black,
          boldText: true,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            SizeConfig.width(4),
          ),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return RatingTile();
            },
          ),
        ),
      ),
    );
  }
}
