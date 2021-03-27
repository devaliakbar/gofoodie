import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/home/data/datasource/home_remote_data_source.dart';
import 'package:gofoodie/features/home/domain/entities/home_data.dart';
import 'package:gofoodie/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({@required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, HomeData>> getHomeData() async {
    try {
      return Right(await homeRemoteDataSource.getHomeData());
    } on NetworkNotAvaliableException {
      return Left(NetworkNotAvaliableFailure());
    } catch (e) {
      return Left(UnExpectedFailure());
    }
  }
}
