import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/profile/domain/entities/profile_data.dart';
import 'package:gofoodie/features/profile/domain/repositories/profile_repository.dart';

class ChangePassword implements UseCase<ProfileData, Params> {
  final ProfileRepository repository;

  ChangePassword({@required this.repository});

  @override
  Future<Either<Failure, ProfileData>> call(Params params) async {
    final Either result = await repository.changePassword(
        fullName: params.fullName,
        email: params.email,
        oldPassword: params.oldPassword,
        newPassword: params.newPassword);

    return result.fold((l) => Left(l), (r) async {
      return Right(ProfileData(name: params.fullName, email: params.email));
    });
  }
}

class Params extends Equatable {
  final String fullName;
  final String email;
  final String oldPassword;
  final String newPassword;

  Params(
      {@required this.fullName,
      @required this.email,
      @required this.oldPassword,
      @required this.newPassword});

  @override
  List<Object> get props => [fullName, email, oldPassword, newPassword];
}
