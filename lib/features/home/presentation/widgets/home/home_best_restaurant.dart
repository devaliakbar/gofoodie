import 'package:flutter/material.dart';

import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/image_from_network.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/home/domain/entities/home_category.dart';

class HomeBestRestaurant extends StatelessWidget {
  final List<HomeCategory> categories;

  HomeBestRestaurant({@required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 15,
          ),
          alignment: Alignment.centerLeft,
          child: NormalText(
            AppString.bestRatedRestaurants,
            color: AppColors.black,
            boldText: true,
            size: FontSizes.fontSizeXL,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: SizeConfig.height(2)),
          height: SizeConfig.width(30) + SizeConfig.height(4),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: SizeConfig.height(1),
                        right: SizeConfig.height(1)),
                    width: SizeConfig.width(25),
                    height: SizeConfig.width(30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ImageFromNetwork(
                        imageUrl: categories[index].imageUrl,
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.width(25),
                    child: NormalText(
                      categories[index].name,
                      size: FontSizes.fontSizeBSM,
                      color: AppColors.black,
                      truncate: true,
                    ),
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
