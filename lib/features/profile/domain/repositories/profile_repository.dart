import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/profile/domain/entities/profile_data.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileData>> getProfileDetail();
  Future<Either<Failure, bool>> changeName(
      {@required String fullName, @required String email});
  Future<Either<Failure, bool>> changeEmail(
      {@required String fullName, @required String email});
}
