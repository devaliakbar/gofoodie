import 'package:flutter/material.dart';
import 'package:gofoodie/features/home/domain/entities/home_category.dart';

class HomeCategoryModel extends HomeCategory {
  HomeCategoryModel(
      {@required String query, @required String name, String imageUrl})
      : super(query: query, name: name, imageUrl: imageUrl);

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
        query: json['query'], name: json['name'], imageUrl: json['imageUrl']);
  }
}
