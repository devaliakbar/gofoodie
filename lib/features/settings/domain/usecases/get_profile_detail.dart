import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/settings/domain/entities/profile_data.dart';
import 'package:gofoodie/features/settings/domain/repositories/settings_repository.dart';

class GetProfileDetail implements UseCase<ProfileData, NoParams> {
  final SettingsRepository repository;

  GetProfileDetail({@required this.repository});

  @override
  Future<Either<Failure, ProfileData>> call(NoParams params) async {
    return await repository.getProfileDetail();
  }
}
