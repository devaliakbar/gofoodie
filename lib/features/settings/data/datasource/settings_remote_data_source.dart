import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/features/settings/data/models/profile_model.dart';

abstract class SettingsRemoteDataSource {
  Future<ProfileModel> getProfileDetails();
}

class SettingsRemoteDataSourceImpl extends SettingsRemoteDataSource {
  final ApiHelper apiHelper;

  SettingsRemoteDataSourceImpl({@required this.apiHelper});

  @override
  Future<ProfileModel> getProfileDetails() async {
    bool result = await apiHelper.isNetworkConnected();

    if (!result) {
      throw NetworkNotAvaliableException();
    }

    try {
      Response response = await Dio().post(
        apiHelper.appendPath(path: "info"),
        options: await apiHelper.getHeaders(),
      );

      return ProfileModel.fromJson(await response.data);
    } on DioError catch (e) {
      if (e.response.statusCode == 401) {
        throw AuthenticationException();
      } else {
        throw UnExpectedException();
      }
    } catch (e) {
      throw UnExpectedException();
    }
  }
}
