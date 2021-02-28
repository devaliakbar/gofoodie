import 'package:flutter/material.dart';
import 'package:gofoodie/features/home/presentation/widgets/home_appbar.dart';
import 'package:gofoodie/features/home/presentation/widgets/home_header.dart';

class Home extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(),
            ],
          ),
        ),
      ),
    );
  }
}
