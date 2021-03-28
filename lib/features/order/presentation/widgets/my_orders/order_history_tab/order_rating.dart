import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/profile/presentation/pages/edit_rating.dart';

class OrderRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: AppColors.lightGrey,
      width: double.infinity,
      child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, EditRating.routeName);
          },
          child: Row(
            children: [
              NormalText(
                "Rate Order",
                color: AppColors.red,
              ),
              SizedBox(
                width: SizeConfig.width(2),
              ),
              RatingBar.builder(
                initialRating: 3,
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
          )),
    );
  }
}
