import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/image_from_network.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class OrderVendorInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.height(2),
        horizontal: SizeConfig.width(3),
      ),
      child: Row(
        children: [
          SizedBox(
            width: SizeConfig.height(7),
            height: SizeConfig.height(7),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                SizeConfig.height(0.5),
              ),
              child: ImageFromNetwork(
                imageUrl: "https://gofoodie.ae/uploads/2203211616393295.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: SizeConfig.width(2.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: NormalText(
                          "Cafe D Arabia",
                          truncate: true,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.height(2),
                      ),
                      NormalText(
                        "Total ₹350.00",
                        truncate: true,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  NormalText(
                    "Lulu Mall Edapally Kochi",
                    truncate: true,
                    size: FontSizes.fontSizeBSM,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
