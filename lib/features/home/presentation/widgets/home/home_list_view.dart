import 'package:flutter/material.dart';

import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/image_from_network.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/home/domain/entities/home_category.dart';
import 'package:gofoodie/features/home/presentation/pages/vendors.dart';
import 'package:gofoodie/features/vendor/presentation/pages/vendor_detail.dart';

class HomeListView extends StatelessWidget {
  final String title;
  final List<HomeCategory> categories;
  final bool isRestaurant;

  HomeListView(
      {@required this.title,
      @required this.categories,
      this.isRestaurant = false});

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
            title,
            color: AppColors.black,
            boldText: true,
            size: FontSizes.fontSizeXL,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: SizeConfig.height(2)),
          height: SizeConfig.width(25) + SizeConfig.height(4),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  if (isRestaurant) {
                    Navigator.pushNamed(context, VendorDetail.routeName,
                        arguments: categories[index].id);
                  } else {
                    Navigator.pushNamed(context, Vendors.routeName,
                        arguments: categories[index].id);
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.height(1),
                          right: SizeConfig.height(1)),
                      width: SizeConfig.width(25),
                      height: SizeConfig.width(25),
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
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
