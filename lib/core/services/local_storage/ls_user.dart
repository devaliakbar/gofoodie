import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gofoodie/features/location/domain/entities/location_model.dart';
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
  static const String _USER_LOCATION_KEY = "user_location";
  Future<LocationModel> getUserLocation() async {
    Box userBox = await Hive.openBox(_BOX_NAME);

    final String userLocation = userBox.get(_USER_LOCATION_KEY);

    await Hive.close();

    if (userLocation == null) {
      return null;
    }

    return LocationModel.fromJson(jsonDecode(userLocation));
  }

  Future<void> saveUserLocation({@required LocationModel locationModel}) async {
    Box userBox = await Hive.openBox(_BOX_NAME);

    await userBox.put(
        _USER_LOCATION_KEY, jsonEncode(LocationModel.toJson(locationModel)));
    await Hive.close();
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////
  static const String _USER_ID_KEY = "user_id";
  Future<int> getUserId() async {
    Box userBox = await Hive.openBox(_BOX_NAME);

    final int userId = userBox.get(_USER_ID_KEY);

    await Hive.close();

    return userId;
  }

  Future<void> saveUserId({@required int userId}) async {
    Box userBox = await Hive.openBox(_BOX_NAME);

    await userBox.put(_USER_ID_KEY, userId);
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
