import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/profile/domain/entities/profile_data.dart';
import 'package:gofoodie/features/profile/domain/repositories/profile_repository.dart';

class ChangeEmail implements UseCase<ProfileData, Params> {
  final ProfileRepository repository;

  ChangeEmail({@required this.repository});

  @override
  Future<Either<Failure, ProfileData>> call(Params params) async {
    final Either result = await repository.changeEmail(
        fullName: params.fullName, email: params.email);

    return result.fold((l) => Left(l), (r) async {
      return Right(ProfileData(name: params.fullName, email: params.email));
    });
  }
}

class Params extends Equatable {
  final String fullName;
  final String email;

  Params({@required this.fullName, @required this.email});

  @override
  List<Object> get props => [fullName, email];
}
