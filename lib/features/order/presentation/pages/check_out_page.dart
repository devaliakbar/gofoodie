import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class CheckOutPage extends StatelessWidget {
  static const String routeName = '/check_out_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.black),
        title: NormalText(
          "Checkout",
          color: AppColors.black,
          boldText: true,
        ),
      ),
    );
  }
}
