import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/image_from_network.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/profile/presentation/pages/edit_rating.dart';

class RatingTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: SizeConfig.height(1),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          SizeConfig.width(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.height(5),
                      height: SizeConfig.height(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.height(0.5),
                        ),
                        child: ImageFromNetwork(
                          imageUrl:
                              "https://gofoodie.ae/uploads/2203211616393295.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.width(3),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NormalText(
                          "Ali Akbar".toUpperCase(),
                          color: AppColors.black,
                          size: FontSizes.fontSizeBSM,
                        ),
                        NormalText(
                          "Feb 18, 2021 AT 03 : 00 PM",
                          size: FontSizes.fontSizeS,
                        )
                      ],
                    )
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: AppColors.red,
                    size: IconSizes.iconSizeM,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, EditRating.routeName);
                  },
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.height(1),
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
            ),
            SizedBox(
              height: SizeConfig.height(0.5),
            ),
            NormalText(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              size: FontSizes.fontSizeS,
            )
          ],
        ),
      ),
    );
  }
}
