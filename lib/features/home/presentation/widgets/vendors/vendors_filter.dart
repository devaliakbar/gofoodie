import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_button.dart';
import 'package:gofoodie/core/widgets/dashed_line.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class VendorsFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: SizeConfig.width(90),
            height: SizeConfig.height(90),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Material(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NormalText(AppString.browseByCat),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_box_outline_blank_outlined,
                                        size: IconSizes.iconSizeM,
                                        color: AppColors.lightBlack,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      NormalText(
                                        "Healthy Food",
                                        size: FontSizes.fontSizeS,
                                        color: AppColors.black,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: DottedLine(
                                direction: Axis.vertical,
                                lineLength: double.infinity,
                                dashColor:
                                    AppColors.lightBlack.withOpacity(0.6),
                                dashGapLength: 10,
                                dashLength: 10,
                                lineThickness: 0.4,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NormalText(AppString.selectLocation),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_box_rounded,
                                        size: IconSizes.iconSizeM,
                                        color: AppColors.green,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      NormalText(
                                        "Healthy Food",
                                        size: FontSizes.fontSizeS,
                                        color: AppColors.black,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 8),
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6),
                                ),
                              ),
                              child: Icon(
                                Icons.close,
                                color: AppColors.lightBlack,
                                size: IconSizes.iconSizeM,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomButton(
                    onClick: () {},
                    title: AppString.apply,
                    width: double.infinity,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
