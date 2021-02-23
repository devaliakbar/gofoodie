import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/authentication/presentation/pages/login_page.dart';
import 'package:gofoodie/features/home/presentation/pages/home.dart';
import 'package:gofoodie/features/welcome/data/datasource/splash_screen_local_data_source.dart';
import 'package:gofoodie/features/welcome/domain/repositories/splash_screen_repository.dart';

class SplashScreenRepositoryImpl implements SplashScreenRepository {
  final SplashScreenLocalDataSource localDataSource;

  SplashScreenRepositoryImpl({@required this.localDataSource});

  @override
  Future<Either<Failure, String>> getRoute() async {
    try {
      bool isUserLoggedIn = await localDataSource.getUserLoginStatus();
      if (isUserLoggedIn) {
        return Right(Home.routeName);
      }
      return Right(LoginPage.routeName);
    } catch (_) {
      return Left(DataStorageFailure());
    }
  }
}
