import 'package:flutter/material.dart';

class LocationModel {
  final double latitude;
  final double longitude;
  final String locationName;

  LocationModel(
      {@required this.latitude,
      @required this.longitude,
      @required this.locationName});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        latitude: json['latitude'],
        longitude: json['longitude'],
        locationName: json['locationName']);
  }

  static Map<String, dynamic> toJson(LocationModel location) {
    return {
      "latitude": location.latitude,
      "longitude": location.longitude,
      "locationName": location.locationName
    };
  }
}
