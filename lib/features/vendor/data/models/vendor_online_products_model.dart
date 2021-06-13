import 'package:flutter/material.dart';
import 'package:gofoodie/features/vendor/data/models/vendor_product_model.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_online_products.dart';

class VendorOnlineProductsModel extends VendorOnlineProducts {
  VendorOnlineProductsModel(
      {@required String nextPage, @required List<VendorProductModel> products})
      : super(nextPage: nextPage, products: products);

  factory VendorOnlineProductsModel.fromJson(Map<String, dynamic> json) {
    //TODO

    final List<VendorProductModel> mProducts = [];
    json['products'].forEach((element) {
      mProducts.add(VendorProductModel.fromJson(element));
    });

    return VendorOnlineProductsModel(
        nextPage: json['next_page'], products: mProducts);
  }
}
