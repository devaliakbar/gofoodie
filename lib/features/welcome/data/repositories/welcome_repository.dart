import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/services/track_context.dart';
import 'package:gofoodie/features/authentication/presentation/pages/login_page.dart';
import 'package:gofoodie/features/home/presentation/pages/home.dart';
import 'package:gofoodie/features/location/domain/entities/location_model.dart';
import 'package:gofoodie/features/location/presentation/blocs/bloc/location_bloc.dart';
import 'package:gofoodie/features/location/presentation/pages/location_page.dart';
import 'package:gofoodie/features/welcome/data/datasource/welcome_local_data_source.dart';
import 'package:gofoodie/features/welcome/domain/repositories/welcome_repository.dart';

class WelcomeRepositoryImpl implements WelcomeRepository {
  final WelcomeLocalDataSource localDataSource;

  WelcomeRepositoryImpl({@required this.localDataSource});

  @override
  Future<Either<Failure, String>> getRoute() async {
    try {
      bool isUserLoggedIn = await localDataSource.getUserLoginStatus();
      if (isUserLoggedIn) {
        final LocationModel location = await localDataSource.getUserLocation();

        if (location != null) {
          BlocProvider.of<LocationBloc>(TrackContext.currentContext).add(
            SetLocation(location: location),
          );

          return Right(Home.routeName);
        }

        return Right(LocationPage.routeName);
      }
      return Right(LoginPage.routeName);
    } catch (_) {
      return Left(DataStorageFailure());
    }
  }
}
