import 'package:flutter/material.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_category.dart';

class VendorCategoryModel extends VendorCategory {
  VendorCategoryModel({@required int id, @required String name})
      : super(id: id, name: name);

  factory VendorCategoryModel.fromJson(Map<String, dynamic> json) {
    return VendorCategoryModel(
        id: json['pivot']['category_id'], name: json['name']);
  }
}
