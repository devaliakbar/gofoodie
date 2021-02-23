import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/data_storage/data_storage.dart';

abstract class SplashScreenLocalDataSource {
  Future<bool> getUserLoginStatus();
}

class SplashScreenLocalDataSourceImpl implements SplashScreenLocalDataSource {
  final DataStorage dataStorage;

  SplashScreenLocalDataSourceImpl({@required this.dataStorage});

  @override
  Future<bool> getUserLoginStatus() async {
    return Future.delayed(const Duration(seconds: 2), () => false);
  }
}
