import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_header/vendor_header_actions.dart';

class VendorHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.vendorBackgound,
          height: SizeConfig.heightWithoutSafeArea(27),
          width: SizeConfig.widthWithoutSafeArea(100),
          fit: BoxFit.cover,
        ),
        Container(
          margin: EdgeInsets.only(
              left: SizeConfig.width(5),
              right: SizeConfig.width(5),
              top: MediaQuery.of(context).padding.top),
          height: SizeConfig.heightWithoutSafeArea(27) -
              MediaQuery.of(context).padding.top,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VendorHeaderActions(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      NormalText(
                        "More Cafe",
                        color: Colors.white,
                        size: FontSizes.fontSizeL,
                        boldText: true,
                      ),
                      SizedBox(
                        width: SizeConfig.width(2),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.width(1),
                            vertical: SizeConfig.width(0.5)),
                        decoration: BoxDecoration(
                            color: AppColors.yellow,
                            borderRadius:
                                BorderRadius.circular(SizeConfig.width(1.5))),
                        child: NormalText(
                          "Open",
                          size: FontSizes.fontSizeXS,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  NormalText(
                    "Dubai",
                    color: Colors.white.withOpacity(0.81),
                    size: FontSizes.fontSizeS,
                  ),
                  SizedBox(
                    height: SizeConfig.height(0.4),
                  ),
                  NormalText(
                    "Gardenia Building, Al Murooj Rotana Complex, Financial Centre Street, Downtown Dubai, Duba1",
                    color: Colors.white.withOpacity(0.81),
                    size: FontSizes.fontSizeS,
                  ),
                  SizedBox(
                    height: SizeConfig.height(2),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
