import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class LSUser {
  static const String _BOX_NAME = "user_box";

  ////////////////////////////////////////////////////////////////////////////////////////////////
  static const String _USER_STATUS_KEY = "isLoggedIn";
  Future<bool> isUserLoggedIn() async {
    Box userBox = await Hive.openBox(_BOX_NAME);

    bool userStatus = userBox.get(_USER_STATUS_KEY);

    await Hive.close();

    if (userStatus == null) {
      return false;
    }
    return userStatus;
  }

  Future<void> setLoginStatus({@required bool isLoggedIn}) async {
    Box userBox = await Hive.openBox(_BOX_NAME);

    await userBox.put(_USER_STATUS_KEY, isLoggedIn);
    await Hive.close();
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////
  static const String _TOKEN_KEY = "token";
  Future<String> getToken() async {
    final storage = new FlutterSecureStorage();
    return await storage.read(key: _TOKEN_KEY);
  }

  Future<void> saveToken({@required String token}) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: _TOKEN_KEY, value: token);
  }
}
