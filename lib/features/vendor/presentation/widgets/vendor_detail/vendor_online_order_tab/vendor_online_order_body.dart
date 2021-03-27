import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/dashed_line.dart';
import 'package:gofoodie/core/widgets/image_from_network.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/core/widgets/quantity_button.dart';

class VendorOnlineOrderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.height(2)),
          child: DottedLine(
            direction: Axis.horizontal,
            dashColor: AppColors.lightBlack.withOpacity(0.3),
            dashGapLength: SizeConfig.width(2),
            dashLength: SizeConfig.width(2),
          ),
        );
      },
      padding: EdgeInsets.only(top: SizeConfig.height(3)),
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: SizeConfig.height(2),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: SizeConfig.height(11),
                      padding: EdgeInsets.only(
                        left: SizeConfig.width(2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NormalText(
                            "Mc Aloo Chicken fry",
                            size: FontSizes.fontSizeBSM,
                            color: AppColors.black,
                            truncate: true,
                          ),
                          NormalText(
                            "AED 18.00",
                            size: FontSizes.fontSizeBSM,
                            color: AppColors.black,
                            truncate: true,
                            boldText: true,
                          ),
                          NormalText(
                            "Lorem ipsum dolor sit amet, nsectetur adipiscing elit. Sed eleifend faucibus nibh vel porttitor. Nullam aliquam varius arcu, sed fermentum mi cursus vitae. Aenean cursus odio eget vestibulum faucibus. Nam nibh erat, vehicula a efficitur quis, auctor eu mauris. Fusce id imperdiet massa.",
                            size: FontSizes.fontSizeXS,
                            color: AppColors.black,
                            truncate: true,
                            maxLine: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: SizeConfig.height(11),
                    width: SizeConfig.height(11),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(SizeConfig.height(2)),
                      child: ImageFromNetwork(
                        imageUrl:
                            "https://gofoodie.ae/uploads/dummy/cuisine/mexicanmedium.jpg",
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: SizeConfig.height(0.4),
              bottom: 0,
              child: QuantityButton(),
            )
          ],
        );
      },
    );
  }
}
