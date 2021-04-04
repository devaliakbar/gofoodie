import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_info.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_detail/vendor_header/vendor_header_actions.dart';

class VendorHeader extends StatelessWidget {
  final VendorInfo vendorInfo;
  VendorHeader({@required this.vendorInfo});

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
                      Flexible(
                        child: NormalText(
                          vendorInfo.name,
                          color: Colors.white,
                          truncate: true,
                          size: FontSizes.fontSizeL,
                          boldText: true,
                        ),
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
                    vendorInfo.address,
                    color: Colors.white.withOpacity(0.81),
                    size: FontSizes.fontSizeS,
                    maxLine: 2,
                    truncate: true,
                  ),
                  SizedBox(
                    height: SizeConfig.height(0.4),
                  ),
                  NormalText(
                    vendorInfo.addressLine,
                    color: Colors.white.withOpacity(0.81),
                    size: FontSizes.fontSizeS,
                    maxLine: 2,
                    truncate: true,
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
