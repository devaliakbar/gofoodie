import 'package:flutter/material.dart';

import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/image_from_network.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class BestRestaurant extends StatelessWidget {
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
            "Best Rated Restaurants",
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
            itemCount: 7,
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
                        imageUrl:
                            "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg",
                      ),
                    ),
                  ),
                  NormalText(
                    "Chalet Grill",
                    size: FontSizes.fontSizeBSM,
                    color: AppColors.black,
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
