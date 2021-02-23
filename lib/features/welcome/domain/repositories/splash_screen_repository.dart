import 'package:dartz/dartz.dart';
import 'package:gofoodie/core/error/failures.dart';

abstract class SplashScreenRepository {
  Future<Either<Failure, String>> getRoute();
}
