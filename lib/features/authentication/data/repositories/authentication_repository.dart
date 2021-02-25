import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:gofoodie/features/authentication/data/models/login_model.dart';
import 'package:gofoodie/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<Either<Failure, bool>> login(
      {@required String email, @required String password}) async {
    try {
      LoginModel loginModel =
          await remoteDataSource.login(email: email, password: password);
      printError(loginModel.token);
      //TODO Save Token
      return Right(true);
    } on NetworkNotAvaliableException {
      return Left(NetworkNotAvaliableFailure());
    } on IncorrectCredentialsException {
      return Left(IncorrectCredentialsFailure());
    } on NetworkErrorException {
      return Left(NetworkErrorFailure());
    }
  }
}
