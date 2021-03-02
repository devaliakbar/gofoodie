import 'package:flutter/material.dart';
import 'package:gofoodie/features/settings/presentation/widgets/profile_appbar.dart';

class Profile extends StatelessWidget {
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      backgroundColor: Colors.white,
    );
  }
}
