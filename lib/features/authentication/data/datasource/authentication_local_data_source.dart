import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/local_storage/ls_user.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> saveTokenAndUserId(
      {@required String token, @required int userId});
  Future<void> setUserLoginStatus();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  final LSUser dataStorage;

  AuthenticationLocalDataSourceImpl({@required this.dataStorage});

  @override
  Future<void> saveTokenAndUserId(
      {@required String token, @required int userId}) async {
    await dataStorage.saveToken(token: token);
    await dataStorage.saveUserId(userId: userId);
  }

  @override
  Future<void> setUserLoginStatus() async {
    await dataStorage.setLoginStatus(isLoggedIn: true);
  }
}
