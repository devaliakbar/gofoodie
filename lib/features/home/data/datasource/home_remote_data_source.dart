import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/features/home/data/models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getHomeData();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiHelper apiHelper;

  HomeRemoteDataSourceImpl({@required this.apiHelper});

  @override
  Future<HomeModel> getHomeData() async {
    bool result = await apiHelper.isNetworkConnected();

    if (!result) {
      throw NetworkNotAvaliableException();
    }

    try {
      Response response = await Dio().get(
        apiHelper.appendPath(path: "landingpage"),
        options: await apiHelper.getHeaders(withToken: false),
      );

      return HomeModel.fromJson(await response.data);
    } catch (e) {
      throw UnExpectedException();
    }
  }
}
