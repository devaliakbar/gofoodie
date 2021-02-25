import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/data_storage/ds_user.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> saveToken(String token);
  Future<void> setUserLoginStatus();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  final DSUser dataStorage;

  AuthenticationLocalDataSourceImpl({@required this.dataStorage});

  @override
  Future<void> saveToken(String token) async {
    await dataStorage.saveToken(token: token);
  }

  @override
  Future<void> setUserLoginStatus() async {
    await dataStorage.setLoginStatus(isLoggedIn: true);
  }
}
