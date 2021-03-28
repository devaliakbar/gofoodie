import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';

class SearchPage extends StatelessWidget {
  static const String routeName = '/search_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.black),
        title: TextField(
          cursorColor: Colors.grey,
          autofocus: true,
          decoration: InputDecoration.collapsed(
            hintText: "Search",
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
