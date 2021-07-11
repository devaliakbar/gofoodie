import 'package:flutter/material.dart';
import 'package:gofoodie/features/order/domain/entities/cart_products.dart';

class Cart {
  final int vendorId;
  final List<CartProducts> products;
  int totalItems;
  double totalAmount;
  bool doesUserPickUp;
  String phone;
  String note;

  Cart(
      {@required this.vendorId,
      @required this.products,
      this.totalItems = 1,
      @required this.totalAmount,
      this.doesUserPickUp = false});
}
