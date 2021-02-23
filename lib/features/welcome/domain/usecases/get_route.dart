import 'package:dartz/dartz.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/welcome/domain/repositories/splash_screen_repository.dart';

class GetRoute implements UseCase<String, NoParams> {
  final SplashScreenRepository splashScreenRepository;

  GetRoute(this.splashScreenRepository);

  @override
  Future<Either<Failure, String>> call(NoParams noParams) async {
    return await splashScreenRepository.getRoute();
  }
}
