import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';

class OrderModel {
  final int orderId;
  final String name;
  final String address;
  final String imageUrl;
  final String total;
  final String time;
  final List<OrderItem> orderItems;

  OrderModel(
      {@required this.orderId,
      @required this.name,
      @required this.address,
      @required this.imageUrl,
      @required this.total,
      @required this.time,
      @required this.orderItems});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final List<OrderItem> items = [];
    json['orderlist'].forEach((element) {
      items.add(OrderItem.fromJson(element));
    });

    final DateTime date = DateTime.parse(json['created_at']);

    return OrderModel(
        orderId: json['id'],
        name: json['vendorinfo']['name'],
        address: json['vendorinfo']['addr'],
        imageUrl: ApiHelper.BASE_SERVER_URL + json['vendorinfo']['avatar'],
        total: json['total'],
        time: DateFormat.yMEd().add_jms().format(date),
        orderItems: items);
  }
}

class OrderItem {
  final int quantity;
  final String productName;

  OrderItem({@required this.quantity, @required this.productName});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
        quantity: json['qty'], productName: json['products']['title']);
  }
}
