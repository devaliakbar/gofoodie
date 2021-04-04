import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_details_entity.dart';

abstract class VendorRepository {
  Future<Either<Failure, List<Vendor>>> getVendors({@required int categoryId});
  Future<Either<Failure, VendorDetailsEntity>> getVendorDetails(
      {@required int vendorId});
}
