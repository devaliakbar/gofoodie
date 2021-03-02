import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/settings/data/datasource/settings_remote_data_source.dart';
import 'package:gofoodie/features/settings/domain/entities/profile_data.dart';
import 'package:gofoodie/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  final SettingsRemoteDataSource remoteDataSource;

  SettingsRepositoryImpl({@required this.remoteDataSource});

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
}
