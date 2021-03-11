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

    json['data']['offer_resturents'].forEach((element) {
      mOfferedRestaurants
          .add(HomeCategoryModel.fromOfferResturentsJson(element));
    });

    List<HomeCategoryModel> mBestRestaurants = [];

    json['data']['toprated'].forEach((element) {
      mBestRestaurants.add(HomeCategoryModel.fromTopRatedJson(element));
    });

    List<HomeCategoryModel> mCategories = [];

    json['data']['categories'].forEach((element) {
      mCategories.add(HomeCategoryModel.fromCategoryJson(element));
    });

    return HomeModel(
        offeredRestaurants: mOfferedRestaurants,
        bestRestaurants: mBestRestaurants,
        categories: mCategories);
  }
}
