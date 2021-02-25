import 'package:get_it/get_it.dart';
import 'package:gofoodie/core/services/data_storage/data_storage.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/features/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:gofoodie/features/authentication/data/repositories/authentication_repository.dart';
import 'package:gofoodie/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:gofoodie/features/authentication/domain/usecases/login.dart';
import 'package:gofoodie/features/authentication/presentation/blocs/login/login_bloc.dart';
import 'package:gofoodie/features/welcome/data/datasource/splash_screen_local_data_source.dart';
import 'package:gofoodie/features/welcome/data/repositories/splash_screen_repository.dart';
import 'package:gofoodie/features/welcome/domain/repositories/splash_screen_repository.dart';
import 'package:gofoodie/features/welcome/domain/usecases/get_route.dart';
import 'package:gofoodie/features/welcome/presentation/blocs/splash_screen/splash_screen_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // 1 WELCOME
  // Bloc
  sl.registerFactory<SplashScreenBloc>(
    () => SplashScreenBloc(getRoute: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetRoute(sl()));
  // Repository
  sl.registerLazySingleton<SplashScreenRepository>(
    () => SplashScreenRepositoryImpl(localDataSource: sl()),
  );
  // Data sources
  sl.registerLazySingleton<SplashScreenLocalDataSource>(
    () => SplashScreenLocalDataSourceImpl(dataStorage: sl()),
  );
  //! Core
  sl.registerLazySingleton(() => DataStorage());
  //! External

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  // 2 AUTHENTICATION
  // Bloc
  sl.registerFactory<LoginBloc>(
    () => LoginBloc(performLogin: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => PerformLogin(sl()));
  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(remoteDataSource: sl()),
  );
  // Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(apiHelper: sl()),
  );
  //! Core
  sl.registerLazySingleton(() => ApiHelper());
  //! External
}
