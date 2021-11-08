import 'package:revolution/constants/routeNames.dart';
import 'package:revolution/pages/function/infiniteScroll.dart';
import 'package:revolution/pages/home/home.dart';
import 'package:revolution/pages/splash.dart';
import 'package:revolution/pages/ui/carousel.dart';
import 'package:revolution/pages/ui/chat.dart';
import 'package:revolution/pages/ui/maskAlert.dart';
import 'package:revolution/pages/ui/progress.dart';
import 'package:revolution/pages/ui/progressIndicator.dart';
import 'package:revolution/pages/ui/ticket.dart';
import 'package:revolution/store/navigationStore.dart';
import 'package:revolution/pages/ui/timer.dart';
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

      // UI
      case RouteNames.Progress:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => ProgressPage(),
        );

      case RouteNames.ProgressIndicator:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => ProgressIndicatorPage(),
        );

      case RouteNames.Timer:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => TimerPage(),
        );

      case RouteNames.Ticket:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => TicketPage(),
        );

      case RouteNames.MaskAlert:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => MaskAlertPage(),
        );

      case RouteNames.Carousel:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => CarouselPage(),
        );

      case RouteNames.Chat:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => ChatPage(),
        );

      // Function
      case RouteNames.InfiniteScroll:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => InfiniteScrollPage(),
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

  // UI
  static toProgressPage() {
    return Navigator.of(context).pushNamed(RouteNames.Progress);
  }

  static toProgressIndicatorPage() {
    return Navigator.of(context).pushNamed(RouteNames.ProgressIndicator);
  }

  static toTimerPage() {
    return Navigator.of(context).pushNamed(RouteNames.Timer);
  }

  static toTicketPage() {
    return Navigator.of(context).pushNamed(RouteNames.Ticket);
  }

  static toMaskAlertPage() {
    return Navigator.of(context).pushNamed(RouteNames.MaskAlert);
  }

  static toCarouselPage() {
    return Navigator.of(context).pushNamed(RouteNames.Carousel);
  }

  static toChatPage() {
    return Navigator.of(context).pushNamed(RouteNames.Chat);
  }

  // Function
  static toInifiteScrollPage() {
    return Navigator.of(context).pushNamed(RouteNames.InfiniteScroll);
  }
}
