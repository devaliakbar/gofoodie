import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_detail/vendor_rating/vendor_rating_overall.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_detail/vendor_rating/vendor_rating_tile.dart';

class VendorRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.width(5),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VendorRatingOverall(),
            VendorRatingTile(),
            VendorRatingTile(),
            VendorRatingTile(),
          ],
        ),
      ),
    );
  }
}
