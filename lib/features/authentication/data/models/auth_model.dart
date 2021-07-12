import 'package:flutter/material.dart';

class AuthModel {
  final int userId;
  final String token;
  final String error;

  AuthModel({
    @required this.userId,
    @required this.token,
    @required this.error,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        userId: json['user_id'], token: json['token'], error: json['errors']);
  }
}
