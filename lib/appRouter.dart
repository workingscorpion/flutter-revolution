import 'package:revolution/constants/routeNames.dart';
import 'package:revolution/pages/function/infiniteScroll.dart';
import 'package:revolution/pages/function/tapjoy.dart';
import 'package:revolution/pages/function/term.dart';
import 'package:revolution/pages/function/terms.dart';
import 'package:revolution/pages/function/qr.dart';
import 'package:revolution/pages/function/qrscan.dart';
import 'package:revolution/pages/function/scanCamera.dart';
import 'package:revolution/pages/home/home.dart';
import 'package:revolution/pages/splash.dart';
import 'package:revolution/pages/ui/adaptiveColor.dart';
import 'package:revolution/pages/ui/carousel.dart';
import 'package:revolution/pages/ui/chat.dart';
import 'package:revolution/pages/ui/grid.dart';
import 'package:revolution/pages/ui/hero.dart';
import 'package:revolution/pages/ui/image.dart';
import 'package:revolution/pages/ui/keypad.dart';
import 'package:revolution/pages/ui/lottery.dart';
import 'package:revolution/pages/ui/maskAlert.dart';
import 'package:revolution/pages/ui/pin.dart';
import 'package:revolution/pages/ui/progress.dart';
import 'package:revolution/pages/ui/progressIndicator.dart';
import 'package:revolution/pages/ui/roulette.dart';
import 'package:revolution/pages/ui/slideNotice.dart';
import 'package:revolution/pages/ui/ticket.dart';
import 'package:revolution/pages/ui/video.dart';
import 'package:revolution/pages/ui/zoom.dart';
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

      case RouteNames.Roulette:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => RoulettePage(),
        );

      case RouteNames.Lottery:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => LotteryPage(),
        );

      case RouteNames.Video:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => VideoPage(),
        );

      case RouteNames.Grid:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => GridPage(),
        );

      case RouteNames.Hero:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => HeroPage(),
        );

      case RouteNames.Pin:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => PinPage(),
        );

      case RouteNames.Keypad:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => KeyPadPage(),
        );

      case RouteNames.Chat:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => ChatPage(),
        );

      case RouteNames.SlideNotice:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => SlideNoticePage(),
        );

      case RouteNames.AdaptiveColor:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => AdaptiveColorPage(),
        );

      case RouteNames.Zoom:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => ZoomPage(),
        );

      case RouteNames.Image:
        return CupertinoPageRoute(
          // return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => ImagePage(
            image: settings.arguments,
          ),
        );

      // Function
      case RouteNames.InfiniteScroll:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => InfiniteScrollPage(),
        );

      case RouteNames.Tapjoy:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => TapjoyPage(),
        );

      case RouteNames.Terms:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => TermsPage(),
        );

      case RouteNames.Term:
        final args = settings.arguments as List;
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => TermPage(
            url: args[0] as String,
            title: args[1] as String,
          ),
        );

      case RouteNames.QR:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => QRPage(),
        );

      case RouteNames.QRScan:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => QRScanPage(),
        );

      case RouteNames.ScanCamera:
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) => ScanCameraPage(),
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

  static valuePop(String value) {
    return Navigator.of(context).pop<String>(value);
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

  static toRoulettePage() {
    return Navigator.of(context).pushNamed(RouteNames.Roulette);
  }

  static toLotteryPage() {
    return Navigator.of(context).pushNamed(RouteNames.Lottery);
  }

  static toVideoPage() {
    return Navigator.of(context).pushNamed(RouteNames.Video);
  }

  static toGridPage() {
    return Navigator.of(context).pushNamed(RouteNames.Grid);
  }

  static toHeroPage() {
    return Navigator.of(context).pushNamed(RouteNames.Hero);
  }

  static toPinPage() {
    return Navigator.of(context).pushNamed(RouteNames.Pin);
  }

  static toKeyPadPage() {
    return Navigator.of(context).pushNamed(RouteNames.Keypad);
  }

  static toChatPage() {
    return Navigator.of(context).pushNamed(RouteNames.Chat);
  }

  static toSlideNoticePage() {
    return Navigator.of(context).pushNamed(RouteNames.SlideNotice);
  }

  static toAdaptiveColorPage() {
    return Navigator.of(context).pushNamed(RouteNames.AdaptiveColor);
  }

  static toZoomPage() {
    return Navigator.of(context).pushNamed(RouteNames.Zoom);
  }

  static toImagePage(String image) {
    return Navigator.of(context).pushNamed(RouteNames.Image, arguments: image);
  }

  // Function
  static toInifiteScrollPage() {
    return Navigator.of(context).pushNamed(RouteNames.InfiniteScroll);
  }

  static toTapjoyPage() {
    return Navigator.of(context).pushNamed(RouteNames.Tapjoy);
  }

  static toTermsPage() {
    return Navigator.of(context).pushNamed(RouteNames.Terms);
  }

  static toTermPage(String url, String title) {
    return Navigator.of(context).pushNamed(
      RouteNames.Term,
      arguments: [url, title],
    );
  }

  static toQRPage() {
    return Navigator.of(context).pushNamed(RouteNames.QR);
  }

  static toQRScanPage() {
    return Navigator.of(context).pushNamed(RouteNames.QRScan);
  }

  static toScanCameraPage() {
    return Navigator.of(context).pushNamed(RouteNames.ScanCamera);
  }
}
