import 'package:flutter/material.dart';
import 'package:gofoodie/features/authentication/presentation/pages/login_page.dart';
import 'package:gofoodie/features/authentication/presentation/pages/signup_page.dart';
import 'package:gofoodie/features/home/presentation/pages/home.dart';
import 'package:gofoodie/features/home/presentation/pages/search_page.dart';
import 'package:gofoodie/features/location/presentation/pages/location_page.dart';
import 'package:gofoodie/features/order/presentation/pages/my_orders.dart';
import 'package:gofoodie/features/order/presentation/pages/payment_method.dart';
import 'package:gofoodie/features/profile/presentation/pages/edit_rating.dart';
import 'package:gofoodie/features/profile/presentation/pages/my_ratings.dart';
import 'package:gofoodie/features/profile/presentation/pages/profile_settings.dart';
import 'package:gofoodie/features/vendor/presentation/pages/vendors.dart';
import 'package:gofoodie/features/order/presentation/pages/check_out_page.dart';
import 'package:gofoodie/features/vendor/presentation/pages/vendor_detail.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return PageTransition(
          child: LoginPage(),
          type: PageTransitionType.fade,
          settings: settings,
        );

      case SignUpPage.routeName:
        return PageTransition(
          child: SignUpPage(),
          type: PageTransitionType.fade,
          settings: settings,
        );

      case Home.routeName:
        return PageTransition(
          child: Home(),
          type: PageTransitionType.fade,
          settings: settings,
        );

      case Vendors.routeName:
        return PageTransition(
          child: Vendors(
            categoryId: settings.arguments,
          ),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );

      case ProfileSettings.routeName:
        return PageTransition(
          child: ProfileSettings(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );

      case VendorDetail.routeName:
        return PageTransition(
          child: VendorDetail(
            vendorId: settings.arguments,
          ),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );

      case CheckOutPage.routeName:
        return PageTransition(
          child: CheckOutPage(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );

      case PaymentMethod.routeName:
        return PageTransition(
          child: PaymentMethod(
            form: settings.arguments,
          ),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );

      case MyOrders.routeName:
        return PageTransition(
          child: MyOrders(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );

      case MyRatings.routeName:
        return PageTransition(
          child: MyRatings(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );

      case EditRating.routeName:
        return PageTransition(
          child: EditRating(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );

      case SearchPage.routeName:
        return PageTransition(
          child: SearchPage(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );

      case LocationPage.routeName:
        return PageTransition(
          child: LocationPage(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );

      default:
        assert(false, 'Need to implement ${settings.name}');
        return null;
    }
  }
}
