import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/settings/domain/entities/profile_data.dart';

abstract class SettingsRepository {
  Future<Either<Failure, ProfileData>> getProfileDetail();
  Future<Either<Failure, bool>> changeName(
      {@required String fullName, @required String email});
}
