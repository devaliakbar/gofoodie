import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/data_storage/ds_user.dart';

abstract class WelcomeLocalDataSource {
  Future<bool> getUserLoginStatus();
}

class WelcomeLocalDataSourceImpl implements WelcomeLocalDataSource {
  final DSUser dataStorage;

  WelcomeLocalDataSourceImpl({@required this.dataStorage});

  @override
  Future<bool> getUserLoginStatus() async {
    return await dataStorage.isUserLoggedIn();
  }
}
