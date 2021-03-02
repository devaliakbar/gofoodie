import 'package:flutter/material.dart';
import 'package:gofoodie/features/settings/domain/entities/profile_data.dart';

class ProfileModel extends ProfileData {
  ProfileModel({@required String name, String email})
      : super(name: name, email: email);

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(name: json['name'], email: json['email']);
  }
}
