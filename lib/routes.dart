import 'package:flutter/material.dart';
import 'package:login_register_app/screens/results.dart';
import 'package:login_register_app/screens/search.dart';
import 'package:login_register_app/screens/subjects.dart';

import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'utils/common_widgets/invalid_route.dart';
import 'screens/home.dart';
import 'values/app_routes.dart';
import 'screens/splashscreen.dart';

class Routes {
  const Routes._();//private constructor

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route<dynamic> getRoute({
      required Widget widget,
      bool fullscreenDialog = false,
    }) {
      return MaterialPageRoute<void>(
        builder: (context) => widget,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    }

    switch (settings.name) {
      case AppRoutes.login:
        return getRoute(widget: const LoginPage());

      case AppRoutes.register:
        return getRoute(widget: const RegisterPage());

      case AppRoutes.home :
        return getRoute(widget: const HomePage());

      case AppRoutes.splash :
        return getRoute(widget: const SplashScreen());

      case AppRoutes.search :
        return getRoute(widget: const SearchScreen());
      case AppRoutes.result:
        return getRoute(widget: const ResultScreen());
      case AppRoutes.subject:
        return getRoute(widget: const SubjectPage());



      /// An invalid route. User shouldn't see this,
      /// it's for debugging purpose only.
      default:
        return getRoute(widget: const InvalidRoute());
    }
  }
}
