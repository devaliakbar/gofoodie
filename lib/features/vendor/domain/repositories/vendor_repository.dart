import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor.dart';

abstract class VendorRepository {
  Future<Either<Failure, List<Vendor>>> getVendors({@required String query});
}
