import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/size_config.dart';

class LoadingView extends StatelessWidget {
  final Color backgroundColor;

  LoadingView({this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: SizeConfig.width(70),
      child: Image.asset(
        'assets/images/loading.gif',
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
