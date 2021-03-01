import 'package:flutter/material.dart';
import 'package:gofoodie/features/home/domain/entities/home_category.dart';

class HomeCategoryModel extends HomeCategory {
  HomeCategoryModel(
      {@required String id, @required String name, String imageUrl})
      : super(id: id, name: name, imageUrl: imageUrl);

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
        id: json['id'], name: json['name'], imageUrl: json['imageUrl']);
  }
}
