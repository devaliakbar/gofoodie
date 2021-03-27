import 'package:dartz/dartz.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/home/domain/entities/home_data.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeData>> getHomeData();
}
