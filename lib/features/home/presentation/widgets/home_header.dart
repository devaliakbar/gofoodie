import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/home/presentation/widgets/home_special_card.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: SizeConfig.height(2.5)),
          padding: EdgeInsets.only(
              bottom: SizeConfig.width(15), left: 15, right: 15, top: 15),
          width: SizeConfig.width(100),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                SizeConfig.width(15),
              ),
              bottomRight: Radius.circular(
                SizeConfig.width(15),
              ),
            ),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 10),
                child: NormalText(
                  "Welcome foodies!",
                  color: AppColors.black,
                  boldText: true,
                  size: FontSizes.fontSizeXL,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: SizeConfig.height(6.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(
                      "Search",
                      color: AppColors.black,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      padding: EdgeInsets.all(SizeConfig.height(1)),
                      child: Icon(
                        Icons.search,
                        size: IconSizes.iconSizeM,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.black,
                      size: IconSizes.iconSizeS,
                    ),
                    NormalText(
                      "Nearby Location",
                      size: FontSizes.fontSizeS,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: SizeConfig.width(100),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: HomeSpecialCard(
                    color: AppColors.orange,
                    text: "Weekly or Monthly Plan",
                    onClick: () {},
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: HomeSpecialCard(
                    color: AppColors.green,
                    text: "Healthy Plan",
                    onClick: () {},
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: HomeSpecialCard(
                    color: AppColors.lightBlue,
                    text: "Go Foodie Kitchen",
                    onClick: () {},
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
