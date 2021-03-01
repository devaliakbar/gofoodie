import 'package:flutter/material.dart';
import 'package:gofoodie/features/home/domain/entities/home_category.dart';

class HomeData {
  final List<HomeCategory> offeredRestaurants;
  final List<HomeCategory> bestRestaurants;
  final List<HomeCategory> categories;

  HomeData(
      {@required this.offeredRestaurants,
      @required this.bestRestaurants,
      @required this.categories});
}
