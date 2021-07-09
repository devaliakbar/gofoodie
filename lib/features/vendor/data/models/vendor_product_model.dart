import 'package:flutter/material.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_product.dart';

class VendorProductModel extends VendorProduct {
  VendorProductModel(
      {@required int id,
      @required String name,
      @required String imageUrl,
      @required double price,
      @required String description})
      : super(
            id: id,
            name: name,
            imageUrl: imageUrl,
            price: price,
            description: description);

  factory VendorProductModel.fromJson(Map<String, dynamic> json) {
    return VendorProductModel(
        id: json['id'],
        name: json['title'],
        imageUrl: json['preview']['content'],
        price: json["price"]['price'] == null
            ? 0.0
            : double.parse(json['price']['price'].toString()),
        description: "");
  }
}
