import 'package:flutter/material.dart';
import 'package:gofoodie/features/home/data/models/home_category_model.dart';
import 'package:gofoodie/features/home/domain/entities/home_data.dart';

class HomeModel extends HomeData {
  HomeModel(
      {@required List<HomeCategoryModel> offeredRestaurants,
      @required List<HomeCategoryModel> bestRestaurants,
      @required List<HomeCategoryModel> categories})
      : super(
            offeredRestaurants: offeredRestaurants,
            bestRestaurants: bestRestaurants,
            categories: categories);

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    List<HomeCategoryModel> mOfferedRestaurants = [];

    json['offeredRestaurants'].forEach((element) {
      mOfferedRestaurants.add(HomeCategoryModel.fromJson(element));
    });

    List<HomeCategoryModel> mBestRestaurants = [];

    json['bestRestaurants'].forEach((element) {
      mBestRestaurants.add(HomeCategoryModel.fromJson(element));
    });

    List<HomeCategoryModel> mCategories = [];

    json['categories'].forEach((element) {
      mCategories.add(HomeCategoryModel.fromJson(element));
    });

    return HomeModel(
        offeredRestaurants: mOfferedRestaurants,
        bestRestaurants: mBestRestaurants,
        categories: mCategories);
  }
}
