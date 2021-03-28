import 'package:flutter/material.dart';
import 'package:gofoodie/core/animation/custom_animation.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/home/presentation/pages/search_page.dart';
import 'package:gofoodie/features/home/presentation/widgets/home/home_special_card.dart';

class HomeHeader extends StatelessWidget {
  final AnimationController animationController;

  HomeHeader({@required this.animationController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: SizeConfig.height(6)),
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
                  AppString.welcomeFoodie,
                  color: AppColors.black,
                  boldText: true,
                  size: FontSizes.fontSizeXL,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SearchPage.routeName);
                },
                child: Container(
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
                        AppString.search,
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
                      AppString.nearbyLocation,
                      size: FontSizes.fontSizeS,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: SizeConfig.height(2),
          child: CustomAnimation(
            playAnimation: false,
            animationController: animationController,
            customAnimationType: CustomAnimationType.leftToRight,
            elasticEffect: true,
            widget: Container(
              width: SizeConfig.width(100),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: HomeSpecialCard(
                      color: AppColors.orange,
                      text: AppString.weeklyOrMonthlyPlan,
                      onClick: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: HomeSpecialCard(
                      color: AppColors.green,
                      text: AppString.healthyPlan,
                      onClick: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: HomeSpecialCard(
                      color: AppColors.lightBlue,
                      text: AppString.goFoodieKitchen,
                      onClick: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
