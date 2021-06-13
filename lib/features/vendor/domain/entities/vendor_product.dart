import 'package:flutter/material.dart';

class VendorProduct {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  VendorProduct(
      {@required this.id,
      @required this.name,
      @required this.imageUrl,
      @required this.price,
      @required this.description});
}
