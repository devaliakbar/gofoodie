import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:gofoodie/features/profile/domain/entities/profile_data.dart';
import 'package:gofoodie/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<Either<Failure, ProfileData>> getProfileDetail() async {
    try {
      return Right(await remoteDataSource.getProfileDetails());
    } on NetworkNotAvaliableException {
      return Left(NetworkNotAvaliableFailure());
    } on AuthenticationException {
      return Left(AuthenticationFailure());
    } catch (e) {
      return Left(UnExpectedFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> changeName(
      {String fullName, String email}) async {
    try {
      return Right(
          await remoteDataSource.changeName(fullName: fullName, email: email));
    } on NetworkNotAvaliableException {
      return Left(NetworkNotAvaliableFailure());
    } on AuthenticationException {
      return Left(AuthenticationFailure());
    } catch (e) {
      return Left(UnExpectedFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> changeEmail(
      {String fullName, String email}) async {
    try {
      return Right(
          await remoteDataSource.changeEmail(fullName: fullName, email: email));
    } on RequiredFieldException catch (e) {
      return Left(RequiredFieldFailure(e.cause));
    } on NetworkNotAvaliableException {
      return Left(NetworkNotAvaliableFailure());
    } on AuthenticationException {
      return Left(AuthenticationFailure());
    } catch (e) {
      return Left(UnExpectedFailure());
    }
  }
}
