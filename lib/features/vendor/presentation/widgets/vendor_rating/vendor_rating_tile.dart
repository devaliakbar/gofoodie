import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/image_from_network.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class VendorRatingTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.height(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: SizeConfig.height(4),
                width: SizeConfig.height(4),
                child: ClipOval(
                  child: ImageFromNetwork(
                    imageUrl:
                        "https://cdn.now.howstuffworks.com/media-content/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg",
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.width(3),
              ),
              NormalText(
                "Ali Akbar".toUpperCase(),
                color: AppColors.black,
                size: FontSizes.fontSizeBSM,
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
    );
  }
}
