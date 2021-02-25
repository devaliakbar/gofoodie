import 'package:dartz/dartz.dart';
import 'package:gofoodie/core/error/failures.dart';

abstract class WelcomeRepository {
  Future<Either<Failure, String>> getRoute();
}
