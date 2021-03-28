import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/features/profile/data/models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfileDetails();
  Future<bool> changeName({String fullName, String email});
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiHelper apiHelper;

  ProfileRemoteDataSourceImpl({@required this.apiHelper});

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
    }
  }

  @override
  Future<bool> changeName({String fullName, String email}) async {
    bool result = await apiHelper.isNetworkConnected();

    if (!result) {
      throw NetworkNotAvaliableException();
    }

    try {
      await Dio().post(apiHelper.appendPath(path: "customer/settings"),
          options: await apiHelper.getHeaders(),
          data: {"name": fullName, "email": email});

      return true;
    } on DioError catch (e) {
      if (e.response.statusCode == 401) {
        throw AuthenticationException();
      } else {
        throw UnExpectedException();
      }
    }
  }
}
