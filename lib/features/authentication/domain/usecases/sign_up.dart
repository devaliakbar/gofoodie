import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/authentication/domain/repositories/authentication_repository.dart';

class PerformSignUp implements UseCase<bool, Params> {
  final AuthenticationRepository authenticationRepository;

  PerformSignUp(this.authenticationRepository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await authenticationRepository.signUp(
        fullName: params.fullName,
        email: params.email,
        password: params.password);
  }
}

class Params extends Equatable {
  final String fullName;
  final String email;
  final String password;

  Params(
      {@required this.fullName, @required this.email, @required this.password});

  @override
  List<Object> get props => [fullName, email, password];
}
