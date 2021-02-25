import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/features/authentication/data/models/auth_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<AuthModel> login({@required String email, @required String password});
  Future<AuthModel> signUp(
      {@required String fullName,
      @required String email,
      @required String password});
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final ApiHelper apiHelper;

  AuthenticationRemoteDataSourceImpl({@required this.apiHelper});

  @override
  Future<AuthModel> login(
      {@required String email, @required String password}) async {
    bool result = await apiHelper.isNetworkConnected();

    if (!result) {
      throw NetworkNotAvaliableException();
    }

    try {
      Response response = await Dio().post(apiHelper.appendPath(path: "login"),
          options: await apiHelper.getHeaders(withToken: false),
          data: {"email": email, "password": password});

      return AuthModel.fromJson(await response.data);
    } catch (e) {
      if (e.response.statusCode == 401) {
        throw IncorrectCredentialsException();
      } else {
        throw UnExpectedException();
      }
    }
  }

  @override
  Future<AuthModel> signUp(
      {String fullName, String email, String password}) async {
    bool result = await apiHelper.isNetworkConnected();

    if (!result) {
      throw NetworkNotAvaliableException();
    }

    try {
      Response response = await Dio().post(
          apiHelper.appendPath(path: "register"),
          options: await apiHelper.getHeaders(withToken: false),
          data: {"name": fullName, "email": email, "password": password});

      return AuthModel.fromJson(await response.data);
    } catch (e) {
      throw UnExpectedException();
    }
  }
}
