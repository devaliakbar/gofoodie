import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/authentication/domain/repositories/authentication_repository.dart';

class PerformLogin implements UseCase<bool, Params> {
  final AuthenticationRepository authenticationRepository;

  PerformLogin(this.authenticationRepository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await authenticationRepository.login(
        email: params.email, password: params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
