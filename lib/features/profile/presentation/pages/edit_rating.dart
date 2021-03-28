import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class EditRating extends StatelessWidget {
  static const String routeName = '/edit_rating';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.black),
        title: NormalText(
          "Edit Review",
          color: AppColors.black,
          boldText: true,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check_outlined,
              color: AppColors.red,
              size: IconSizes.iconSizeXL,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(
              SizeConfig.width(4),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: RatingBar.builder(
                    itemPadding: EdgeInsets.only(
                      right: SizeConfig.width(3),
                    ),
                    glow: false,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: SizeConfig.width(8),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: AppColors.red,
                    ),
                    onRatingUpdate: (_) {},
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height(2),
                ),
                CustomTextField(
                  label: "Description",
                  maxLine: 7,
                  borderRadius: SizeConfig.width(3),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
