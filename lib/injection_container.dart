import 'package:get_it/get_it.dart';
import 'package:gofoodie/core/services/local_storage/local_storage.dart';
import 'package:gofoodie/core/services/local_storage/ls_user.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/features/authentication/data/datasource/authentication_local_data_source.dart';
import 'package:gofoodie/features/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:gofoodie/features/authentication/data/repositories/authentication_repository.dart';
import 'package:gofoodie/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:gofoodie/features/authentication/domain/usecases/login.dart';
import 'package:gofoodie/features/authentication/domain/usecases/sign_up.dart';
import 'package:gofoodie/features/authentication/presentation/blocs/login/login_bloc.dart';
import 'package:gofoodie/features/authentication/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:gofoodie/features/home/data/datasource/home_remote_data_source.dart';
import 'package:gofoodie/features/home/data/repositories/home_repository.dart';
import 'package:gofoodie/features/home/domain/repositories/home_repository.dart';
import 'package:gofoodie/features/home/domain/usecases/get_home_data.dart';
import 'package:gofoodie/features/home/presentation/blocs/home/home_bloc.dart';
import 'package:gofoodie/features/welcome/data/datasource/welcome_local_data_source.dart';
import 'package:gofoodie/features/welcome/data/repositories/welcome_repository.dart';
import 'package:gofoodie/features/welcome/domain/repositories/welcome_repository.dart';
import 'package:gofoodie/features/welcome/domain/usecases/get_route.dart';
import 'package:gofoodie/features/welcome/presentation/blocs/splash_screen/splash_screen_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Core
  sl.registerSingleton<LocalStorage>(LocalStorage());
  sl.registerLazySingleton(() => LSUser());
  sl.registerLazySingleton(() => ApiHelper());
  //! External

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  // 1 WELCOME
  // Bloc
  sl.registerFactory<SplashScreenBloc>(
    () => SplashScreenBloc(getRoute: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetRoute(sl()));
  // Repository
  sl.registerLazySingleton<WelcomeRepository>(
    () => WelcomeRepositoryImpl(localDataSource: sl()),
  );
  // Data sources
  sl.registerLazySingleton<WelcomeLocalDataSource>(
    () => WelcomeLocalDataSourceImpl(dataStorage: sl()),
  );

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  // 2 AUTHENTICATION
  // Bloc
  sl.registerFactory<LoginBloc>(
    () => LoginBloc(performLogin: sl()),
  );
  sl.registerFactory<SignUpBloc>(
    () => SignUpBloc(performSignUp: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => PerformLogin(sl()));
  sl.registerLazySingleton(() => PerformSignUp(sl()));
  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
        remoteDataSource: sl(), localDataSource: sl()),
  );
  // Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(apiHelper: sl()),
  );
  sl.registerLazySingleton<AuthenticationLocalDataSource>(
    () => AuthenticationLocalDataSourceImpl(dataStorage: sl()),
  );

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  // 3 HOME
  // Bloc
  sl.registerFactory<HomeBloc>(
    () => HomeBloc(getHomeData: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetHomeData(sl()));
  // Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(homeRemoteDataSource: sl()),
  );
  // Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiHelper: sl()),
  );
}
