import 'package:btrips/constants/routeNames.dart';
import 'package:btrips/pages/home/home.dart';
import 'package:btrips/pages/splash.dart';
import 'package:btrips/pages/ui/progress.dart';
import 'package:btrips/store/navigationStore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<CupertinoPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.Splash:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => SplashPage(),
        );

      case RouteNames.Home:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => HomePage(),
        );

      case RouteNames.Progress:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => ProgressPage(),
        );

      default:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => SplashPage(),
        );
    }
  }

  static get context => NavigationStore.instance.navigatorKey.currentContext;

  static pop() {
    return Navigator.of(context).pop();
  }

  static toHomePage() {
    return Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.Home, (Route route) => false);
  }

  static toProgressPage() {
    return Navigator.of(context).pushNamed(RouteNames.Progress);
  }
}
