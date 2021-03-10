import 'package:flutter/material.dart';

class HomeCategory {
  // THIS QUERY SOME TIMES WILL BE ID(FOR RESTRAUNT)
  final String query;
  final String name;
  final String imageUrl;

  HomeCategory(
      {@required this.query, @required this.name, @required this.imageUrl});
}
