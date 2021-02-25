import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/local_storage/ls_user.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> saveToken(String token);
  Future<void> setUserLoginStatus();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  final LSUser dataStorage;

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
