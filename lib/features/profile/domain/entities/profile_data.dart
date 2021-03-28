import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProfileData extends Equatable {
  final String name;
  final String email;

  ProfileData({@required this.name, @required this.email});

  @override
  List<Object> get props => [name, email];
}
