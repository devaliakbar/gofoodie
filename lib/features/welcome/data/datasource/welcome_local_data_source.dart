import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/local_storage/ls_user.dart';
import 'package:gofoodie/features/location/domain/entities/location_model.dart';

abstract class WelcomeLocalDataSource {
  Future<bool> getUserLoginStatus();
  Future<LocationModel> getUserLocation();
}

class WelcomeLocalDataSourceImpl implements WelcomeLocalDataSource {
  final LSUser dataStorage;

  WelcomeLocalDataSourceImpl({@required this.dataStorage});

  @override
  Future<bool> getUserLoginStatus() async {
    return await dataStorage.isUserLoggedIn();
  }

  @override
  Future<LocationModel> getUserLocation() async {
    return await dataStorage.getUserLocation();
  }
}
