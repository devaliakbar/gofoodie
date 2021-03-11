import 'package:flutter/material.dart';
import 'package:gofoodie/features/home/domain/entities/home_category.dart';

class HomeCategoryModel extends HomeCategory {
  HomeCategoryModel({@required int id, @required String name, String imageUrl})
      : super(id: id, name: name, imageUrl: imageUrl);

  factory HomeCategoryModel.fromOfferResturentsJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
        id: json['userwithpreview']['id'],
        name: json['userwithpreview']['name'],
        imageUrl: json['userwithpreview']['avatar']);
  }

  factory HomeCategoryModel.fromTopRatedJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
        id: json['res_id'], name: json['name'], imageUrl: json['avatar']);
  }

  factory HomeCategoryModel.fromCategoryJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
        id: json['id'], name: json['name'], imageUrl: json['avatar']);
  }
}
