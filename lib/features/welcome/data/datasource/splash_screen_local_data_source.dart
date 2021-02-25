import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/data_storage/ds_user.dart';

abstract class SplashScreenLocalDataSource {
  Future<bool> getUserLoginStatus();
}

class SplashScreenLocalDataSourceImpl implements SplashScreenLocalDataSource {
  final DSUser dataStorage;

  SplashScreenLocalDataSourceImpl({@required this.dataStorage});

  @override
  Future<bool> getUserLoginStatus() async {
    return await dataStorage.isUserLoggedIn();
  }
}
