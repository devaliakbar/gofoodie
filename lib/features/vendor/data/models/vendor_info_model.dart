import 'package:flutter/material.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_info.dart';

class VendorInfoModel extends VendorInfo {
  VendorInfoModel(
      {@required String name,
      @required String phone,
      @required String email,
      @required String address,
      @required String addressLine,
      @required String description})
      : super(
            name: name,
            phone: phone,
            email: email,
            address: address,
            addressLine: addressLine,
            description: description);

  factory VendorInfoModel.fromJson(Map<String, dynamic> json) {
    return VendorInfoModel(
        name: json['info']['info']['name'],
        phone: json['info']['info']['about']['phone1'],
        email: json['info']['info']['about']['email1'],
        address: json['info']['info']['about']['full_address'],
        addressLine: json['info']['info']['about']['address_line'],
        description: json['info']['info']['about']['description']);
  }
}
