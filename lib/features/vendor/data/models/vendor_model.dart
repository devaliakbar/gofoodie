import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor.dart';

class VendorModel extends Vendor {
  VendorModel({@required int id, @required String name, String imageUrl})
      : super(id: id, name: name, imageUrl: imageUrl);

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
        id: json['users']['id'],
        name: json['users']['name'],
        imageUrl: ApiHelper.BASE_SERVER_URL + json['users']['avatar']);
  }
}
