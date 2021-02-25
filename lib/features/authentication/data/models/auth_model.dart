import 'package:flutter/material.dart';

class AuthModel {
  final String loginId;
  final String token;
  final String error;

  AuthModel({
    @required this.loginId,
    @required this.token,
    @required this.error,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        loginId: json['login_id'], token: json['token'], error: json['errors']);
  }
}
