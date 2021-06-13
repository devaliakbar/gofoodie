import 'package:flutter/material.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_product.dart';

class CartProducts extends VendorProduct {
  int qty;

  CartProducts(
      {@required int id,
      @required String name,
      @required String imageUrl,
      @required double price,
      @required String description,
      int qty = 1})
      : this.qty = qty,
        super(
            id: id,
            name: name,
            imageUrl: imageUrl,
            price: price,
            description: description);
}
