import 'package:flutter/material.dart';

class LoginModel {
  final String loginId;
  final String token;

  LoginModel({
    @required this.loginId,
    @required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(loginId: json['login_id'], token: json['token']);
  }
}
