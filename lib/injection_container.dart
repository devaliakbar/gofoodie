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
import 'package:gofoodie/features/location/presentation/blocs/bloc/location_bloc.dart';
import 'package:gofoodie/features/order/domain/usecases/cart_usecase.dart';
import 'package:gofoodie/features/order/presentation/blocs/cart/cart_bloc.dart';
import 'package:gofoodie/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:gofoodie/features/profile/data/repositories/profile_repository.dart';
import 'package:gofoodie/features/profile/domain/repositories/profile_repository.dart';
import 'package:gofoodie/features/profile/domain/usecases/change_email.dart';
import 'package:gofoodie/features/profile/domain/usecases/change_name.dart';
import 'package:gofoodie/features/profile/domain/usecases/change_password.dart';
import 'package:gofoodie/features/profile/domain/usecases/get_profile_detail.dart';
import 'package:gofoodie/features/profile/presentation/blocs/profile/profile_bloc.dart';
import 'package:gofoodie/features/vendor/data/datasource/vendor_remote_data_source.dart';
import 'package:gofoodie/features/vendor/data/repositories/vendor_repository.dart';
import 'package:gofoodie/features/vendor/domain/repositories/vendor_repository.dart';
import 'package:gofoodie/features/vendor/domain/usecases/book_table.dart';
import 'package:gofoodie/features/vendor/domain/usecases/get_vendor_details.dart';
import 'package:gofoodie/features/vendor/domain/usecases/get_vendor_products.dart';
import 'package:gofoodie/features/vendor/domain/usecases/get_vendors.dart';
import 'package:gofoodie/features/home/presentation/blocs/home/home_bloc.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/book_table/book_table_bloc.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendor_details/vendor_details_bloc.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendor_online_order/vendor_online_order_bloc.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendors/vendors_bloc.dart';
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
  sl.registerLazySingleton(() => ApiHelper(user: sl()));
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

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  // 4 Settings
  // Bloc
  sl.registerFactory<ProfileBloc>(
    () => ProfileBloc(
        getProfileDetail: sl(),
        changeName: sl(),
        changeEmail: sl(),
        changePassword: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetProfileDetail(repository: sl()));
  sl.registerLazySingleton(() => ChangeName(repository: sl()));
  sl.registerLazySingleton(() => ChangeEmail(repository: sl()));
  sl.registerLazySingleton(() => ChangePassword(repository: sl()));
  // Repository
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(remoteDataSource: sl()),
  );
  // Data sources
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(apiHelper: sl()),
  );

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  // 5 Vendor
  // Bloc
  sl.registerFactory<VendorsBloc>(
    () => VendorsBloc(getVendors: sl()),
  );
  sl.registerFactory<VendorDetailsBloc>(
    () => VendorDetailsBloc(getVendorDetails: sl()),
  );
  sl.registerFactory<BookTableBloc>(
    () => BookTableBloc(bookTable: sl()),
  );
  sl.registerFactory<VendorOnlineOrderBloc>(
    () => VendorOnlineOrderBloc(getVendorProducts: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetVendors(sl()));
  sl.registerLazySingleton(() => GetVendorDetails(sl()));
  sl.registerLazySingleton(() => BookTable(sl()));
  sl.registerLazySingleton(() => GetVendorProducts(sl()));
  // Repository
  sl.registerLazySingleton<VendorRepository>(
    () => VendorRepositoryImpl(vendorRemoteDataSource: sl()),
  );
  // Data sources
  sl.registerLazySingleton<VendorRemoteDataSource>(
    () => VendorRemoteDataSourceImpl(apiHelper: sl()),
  );

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  // 6 Order
  // Bloc
  sl.registerFactory<CartBloc>(
    () => CartBloc(cartUsecase: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => CartUsecase());

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  // 7 Order
  // Bloc
  sl.registerFactory<LocationBloc>(
    () => LocationBloc(),
  );
}
