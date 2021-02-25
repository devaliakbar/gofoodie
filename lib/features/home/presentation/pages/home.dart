import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/local_storage/local_storage.dart';
import 'package:gofoodie/core/widgets/custom_button.dart';
import 'package:gofoodie/injection_container.dart';

class Home extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
            onClick: () async {
              await sl<LocalStorage>().clearAllLocalData();
            },
            title: "Logo Out"),
      ),
    );
  }
}
