import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/vendor/data/datasource/vendor_remote_data_source.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_details_entity.dart';
import 'package:gofoodie/features/vendor/domain/repositories/vendor_repository.dart';

class VendorRepositoryImpl extends VendorRepository {
  final VendorRemoteDataSource vendorRemoteDataSource;

  VendorRepositoryImpl({@required this.vendorRemoteDataSource});

  @override
  Future<Either<Failure, List<Vendor>>> getVendors(
      {@required int categoryId}) async {
    try {
      return Right(
          await vendorRemoteDataSource.getVendors(categoryId: categoryId));
    } on NetworkNotAvaliableException {
      return Left(NetworkNotAvaliableFailure());
    } catch (e) {
      return Left(UnExpectedFailure());
    }
  }

  @override
  Future<Either<Failure, VendorDetailsEntity>> getVendorDetails(
      {@required int vendorId}) async {
    try {
      return Right(
          await vendorRemoteDataSource.getVendorDetails(vendorId: vendorId));
    } on NetworkNotAvaliableException {
      return Left(NetworkNotAvaliableFailure());
    } catch (e) {
      return Left(UnExpectedFailure());
    }
  }
}
