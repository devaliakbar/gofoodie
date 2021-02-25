import 'package:dartz/dartz.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/welcome/domain/repositories/welcome_repository.dart';

class GetRoute implements UseCase<String, NoParams> {
  final WelcomeRepository welcomeRepository;

  GetRoute(this.welcomeRepository);

  @override
  Future<Either<Failure, String>> call(NoParams noParams) async {
    return await welcomeRepository.getRoute();
  }
}
