import 'package:flutter/material.dart';
import 'package:gofoodie/features/vendor/data/models/vendor_category_model.dart';
import 'package:gofoodie/features/vendor/data/models/vendor_info_model.dart';
import 'package:gofoodie/features/vendor/data/models/vendor_opening_time_model.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_details_entity.dart';

class VendorDetailsModel extends VendorDetailsEntity {
  VendorDetailsModel(
      {@required VendorInfoModel vendorInfoModel,
      @required List<VendorCategoryModel> vendorCategories,
      @required List<String> gallery,
      @required List<VendorOpeningTimeModel> vendorOpeningTimes})
      : super(
            vendorInfo: vendorInfoModel,
            vendorCategories: vendorCategories,
            gallery: gallery,
            vendorOpeningTimes: vendorOpeningTimes);

  factory VendorDetailsModel.fromJson(Map<String, dynamic> json) {
    List<VendorCategoryModel> shopcategory = [];

    json['info']['info']['shopcategory'].forEach((element) {
      shopcategory.add(VendorCategoryModel.fromJson(element));
    });

    List<String> gallery = [];

    json['info']['info']['gallary'].forEach((element) {
      gallery.add(element);
    });

    List<VendorOpeningTimeModel> vendorOpeningTimes = [];

    json['info']['info']['shopday'].forEach((element) {
      vendorOpeningTimes.add(VendorOpeningTimeModel.fromJson(element));
    });

    return VendorDetailsModel(
        vendorInfoModel: VendorInfoModel.fromJson(json),
        vendorCategories: shopcategory,
        gallery: gallery,
        vendorOpeningTimes: vendorOpeningTimes);
  }
}
