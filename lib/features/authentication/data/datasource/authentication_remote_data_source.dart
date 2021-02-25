import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/features/authentication/data/models/login_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<LoginModel> login({@required String email, @required String password});
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final ApiHelper apiHelper;

  AuthenticationRemoteDataSourceImpl({@required this.apiHelper});

  @override
  Future<LoginModel> login(
      {@required String email, @required String password}) async {
    bool result = await apiHelper.isNetworkConnected();

    if (!result) {
      throw NetworkNotAvaliableException();
    }

    try {
      Response response = await Dio().post(apiHelper.appendPath(path: "login"),
          options: await apiHelper.getHeaders(withToken: false),
          data: {"email": email, "password": password});

      return LoginModel.fromJson(await response.data);
    } catch (e) {
      if (e.response.statusCode == 401) {
        throw IncorrectCredentialsException();
      } else {
        throw NetworkErrorException();
      }
    }
  }
}
