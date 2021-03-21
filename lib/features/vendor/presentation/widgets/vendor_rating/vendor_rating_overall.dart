import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:percent_indicator/percent_indicator.dart';

class VendorRatingOverall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NormalText(
          "Rating & Reviews",
          boldText: true,
        ),
        SizedBox(
          height: SizeConfig.height(1),
        ),
        Row(
          children: [
            Column(
              children: [
                NormalText(
                  "3.9",
                  size: FontSizes.ratingFontSize,
                  boldText: true,
                  color: AppColors.black,
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ignoreGestures: true,
                  itemSize: IconSizes.iconSizeXXXXS,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: AppColors.red,
                  ),
                  onRatingUpdate: (_) {},
                )
              ],
            ),
            SizedBox(
              width: SizeConfig.width(5),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: SizeConfig.width(3),
                        child: NormalText(
                          "5",
                          color: AppColors.black,
                          size: FontSizes.fontSizeXS,
                          boldText: true,
                        ),
                      ),
                      Expanded(
                        child: LinearPercentIndicator(
                          lineHeight: SizeConfig.height(1),
                          percent: 0.5,
                          progressColor: AppColors.red,
                          backgroundColor:
                              AppColors.lightBlack.withOpacity(0.3),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: SizeConfig.width(3),
                        child: NormalText(
                          "4",
                          color: AppColors.black,
                          size: FontSizes.fontSizeXS,
                          boldText: true,
                        ),
                      ),
                      Expanded(
                        child: LinearPercentIndicator(
                          lineHeight: SizeConfig.height(1),
                          percent: 0.6,
                          progressColor: AppColors.red,
                          backgroundColor:
                              AppColors.lightBlack.withOpacity(0.3),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: SizeConfig.width(3),
                        child: NormalText(
                          "3",
                          color: AppColors.black,
                          size: FontSizes.fontSizeXS,
                          boldText: true,
                        ),
                      ),
                      Expanded(
                          child: LinearPercentIndicator(
                        lineHeight: SizeConfig.height(1),
                        percent: 0.7,
                        progressColor: AppColors.red,
                        backgroundColor: AppColors.lightBlack.withOpacity(0.3),
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: SizeConfig.width(3),
                        child: NormalText(
                          "2",
                          color: AppColors.black,
                          size: FontSizes.fontSizeXS,
                          boldText: true,
                        ),
                      ),
                      Expanded(
                          child: LinearPercentIndicator(
                        lineHeight: SizeConfig.height(1),
                        percent: 0.3,
                        progressColor: AppColors.red,
                        backgroundColor: AppColors.lightBlack.withOpacity(0.3),
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: SizeConfig.width(3),
                        child: NormalText(
                          "1",
                          color: AppColors.black,
                          size: FontSizes.fontSizeXS,
                          boldText: true,
                        ),
                      ),
                      Expanded(
                          child: LinearPercentIndicator(
                        lineHeight: SizeConfig.height(1),
                        percent: 0.1,
                        progressColor: AppColors.red,
                        backgroundColor: AppColors.lightBlack.withOpacity(0.3),
                      ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
