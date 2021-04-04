import 'package:flutter/material.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_category.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_info.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_opening_time.dart';

class VendorDetailsEntity {
  final VendorInfo vendorInfo;
  final List<VendorCategory> vendorCategories;
  final List<String> gallery;
  final List<VendorOpeningTime> vendorOpeningTimes;

  VendorDetailsEntity(
      {@required this.vendorInfo,
      @required this.vendorCategories,
      @required this.gallery,
      @required this.vendorOpeningTimes});
}
