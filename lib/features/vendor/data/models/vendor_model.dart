import 'package:flutter/material.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor.dart';

class VendorModel extends Vendor {
  VendorModel({@required String id, @required String name, String imageUrl})
      : super(id: id, name: name, imageUrl: imageUrl);

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
        id: json['id'], name: json['name'], imageUrl: json['imageUrl']);
  }
}
