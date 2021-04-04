import 'package:flutter/material.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_opening_time.dart';

class VendorOpeningTimeModel extends VendorOpeningTime {
  VendorOpeningTimeModel(
      {@required String day,
      @required String openTime,
      @required String closeTime})
      : super(day: day, openTime: openTime, closeTime: closeTime);

  factory VendorOpeningTimeModel.fromJson(Map<String, dynamic> json) {
    return VendorOpeningTimeModel(
        day: json['day'], openTime: json['opening'], closeTime: json['close']);
  }
}
