import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/home/domain/entities/home_data.dart';
import 'package:gofoodie/features/home/domain/entities/vendor.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeData>> getHomeData();

  Future<Either<Failure, List<Vendor>>> getVendors({@required String query});
}
