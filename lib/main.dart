import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/route/route.dart';
import 'package:gofoodie/core/services/local_storage/local_storage.dart';
import 'package:gofoodie/features/authentication/presentation/blocs/login/login_bloc.dart';
import 'package:gofoodie/features/authentication/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:gofoodie/features/home/presentation/blocs/home/home_bloc.dart';
import 'package:gofoodie/features/order/presentation/blocs/cart/cart_bloc.dart';
import 'package:gofoodie/features/profile/presentation/blocs/profile/profile_bloc.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/book_table/book_table_bloc.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendor_details/vendor_details_bloc.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendor_online_order/vendor_online_order_bloc.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendors/vendors_bloc.dart';
import 'package:gofoodie/features/welcome/presentation/blocs/splash_screen/splash_screen_bloc.dart';
import 'package:gofoodie/features/welcome/presentation/pages/splash_screen.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  await di.sl<LocalStorage>().init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SplashScreenBloc>(
            create: (context) => di.sl<SplashScreenBloc>()),
        BlocProvider<LoginBloc>(create: (context) => di.sl<LoginBloc>()),
        BlocProvider<SignUpBloc>(create: (context) => di.sl<SignUpBloc>()),
        BlocProvider<HomeBloc>(create: (context) => di.sl<HomeBloc>()),
        BlocProvider<VendorsBloc>(create: (context) => di.sl<VendorsBloc>()),
        BlocProvider<VendorDetailsBloc>(
            create: (context) => di.sl<VendorDetailsBloc>()),
        BlocProvider<ProfileBloc>(create: (context) => di.sl<ProfileBloc>()),
        BlocProvider<BookTableBloc>(
            create: (context) => di.sl<BookTableBloc>()),
        BlocProvider<VendorOnlineOrderBloc>(
            create: (context) => di.sl<VendorOnlineOrderBloc>()),
        BlocProvider<CartBloc>(create: (context) => di.sl<CartBloc>()),
      ],
      child: EasyLocalization(
        child: MyApp(),
        supportedLocales: [Locale('en', 'US')],
        fallbackLocale: Locale('en', 'US'),
        path: 'assets/lang',
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoFoodie',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        fontFamily: 'Poppins',
        splashColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: SplashScreen(),
    );
  }
}
