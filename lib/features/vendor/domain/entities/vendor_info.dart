import 'package:flutter/material.dart';

class VendorInfo {
  final String name;
  final String address;
  final String addressLine;
  final String email;
  final String phone;
  final String description;

  VendorInfo(
      {@required this.name,
      @required this.address,
      @required this.addressLine,
      @required this.email,
      @required this.phone,
      @required this.description});
}
