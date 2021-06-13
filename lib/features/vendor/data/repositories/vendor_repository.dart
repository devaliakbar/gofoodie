import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/vendor/data/datasource/vendor_remote_data_source.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_details_entity.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_product.dart';
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

  @override
  Future<Either<Failure, bool>> bookTable(
      {int numberOfGuest,
      String dateOfBooking,
      String name,
      String email,
      String phone,
      int vendorId}) async {
    try {
      return Right(await vendorRemoteDataSource.bookTable(
          numberOfGuest: numberOfGuest,
          dateOfBooking: dateOfBooking,
          name: name,
          email: email,
          phone: phone,
          vendorId: vendorId));
    } on NetworkNotAvaliableException {
      return Left(NetworkNotAvaliableFailure());
    } on AuthenticationException {
      return Left(AuthenticationFailure());
    } catch (e) {
      return Left(UnExpectedFailure());
    }
  }

  @override
  Future<Either<Failure, List<VendorProduct>>> getProducts(
      {@required int vendorId, @required int categoryId}) async {
    try {
      return Right(
        await vendorRemoteDataSource.getVendorProducts(
            vendorId: vendorId, categoryId: categoryId),
      );
    } on NetworkNotAvaliableException {
      return Left(NetworkNotAvaliableFailure());
    } catch (e) {
      return Left(UnExpectedFailure());
    }
  }
}
