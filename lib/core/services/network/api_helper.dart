import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/services/local_storage/ls_user.dart';

class ApiHelper {
  final LSUser user;

  ApiHelper({@required this.user});

  static const String _BASE_SERVER_URL = "https://gofoodie.ae/api/";

  Future<bool> isNetworkConnected() async {
    return DataConnectionChecker().hasConnection;
  }

  Future<Options> getHeaders(
      {bool withToken = true, Map<String, String> appendHeader}) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    if (withToken) {
      String token = await user.getToken();
      if (token == null) {
        throw AuthenticationException();
      }
      header['Authorization'] = "Bearer $token";
    }

    if (appendHeader != null) {
      header.addAll(appendHeader);
    }

    return Options(headers: header);
  }

  String appendPath({@required String path}) {
    return Uri.encodeFull(_BASE_SERVER_URL + path);
  }
}
