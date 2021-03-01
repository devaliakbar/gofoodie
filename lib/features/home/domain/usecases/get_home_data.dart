import 'package:dartz/dartz.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/home/domain/entities/home_data.dart';
import 'package:gofoodie/features/home/domain/repositories/home_repository.dart';

class GetHomeData implements UseCase<HomeData, NoParams> {
  final HomeRepository homeRepository;

  GetHomeData(this.homeRepository);

  @override
  Future<Either<Failure, HomeData>> call(NoParams noParams) async {
    return await homeRepository.getHomeData();
  }
}
