import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, bool>> login(
      {@required String email, @required String password});
}
