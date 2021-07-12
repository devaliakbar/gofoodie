import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/authentication/data/datasource/authentication_local_data_source.dart';
import 'package:gofoodie/features/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:gofoodie/features/authentication/data/models/auth_model.dart';
import 'package:gofoodie/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;
  final AuthenticationLocalDataSource localDataSource;

  AuthenticationRepositoryImpl(
      {@required this.remoteDataSource, @required this.localDataSource});

  @override
  Future<Either<Failure, bool>> login(
      {@required String email, @required String password}) async {
    try {
      AuthModel response =
          await remoteDataSource.login(email: email, password: password);
      await localDataSource.saveTokenAndUserId(
          token: response.token, userId: response.userId);
      await localDataSource.setUserLoginStatus();
      return Right(true);
    } on NetworkNotAvaliableException {
      return Left(NetworkNotAvaliableFailure());
    } on IncorrectCredentialsException {
      return Left(IncorrectCredentialsFailure());
    } on UnExpectedException {
      return Left(UnExpectedFailure());
    } catch (e) {
      return Left(DataStorageFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> signUp(
      {String fullName, String email, String password}) async {
    try {
      AuthModel response = await remoteDataSource.signUp(
          fullName: fullName, email: email, password: password);

      if (response.error != null) {
        return Left(RequiredFieldFailure(response.error));
      }

      await localDataSource.saveTokenAndUserId(
          token: response.token, userId: response.userId);
      await localDataSource.setUserLoginStatus();
      return Right(true);
    } on NetworkNotAvaliableException {
      return Left(NetworkNotAvaliableFailure());
    } on IncorrectCredentialsException {
      return Left(IncorrectCredentialsFailure());
    } on UnExpectedException {
      return Left(UnExpectedFailure());
    } catch (e) {
      return Left(DataStorageFailure());
    }
  }
}
