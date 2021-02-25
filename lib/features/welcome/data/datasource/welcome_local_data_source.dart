import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/local_storage/ls_user.dart';

abstract class WelcomeLocalDataSource {
  Future<bool> getUserLoginStatus();
}

class WelcomeLocalDataSourceImpl implements WelcomeLocalDataSource {
  final LSUser dataStorage;

  WelcomeLocalDataSourceImpl({@required this.dataStorage});

  @override
  Future<bool> getUserLoginStatus() async {
    return await dataStorage.isUserLoggedIn();
  }
}
