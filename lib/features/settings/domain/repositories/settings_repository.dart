import 'package:dartz/dartz.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/features/settings/domain/entities/profile_data.dart';

abstract class SettingsRepository {
  Future<Either<Failure, ProfileData>> getProfileDetail();
}
