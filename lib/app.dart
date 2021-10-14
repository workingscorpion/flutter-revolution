import 'package:revolution/appRouter.dart';
import 'package:revolution/constants/routeNames.dart';
import 'package:revolution/store/navigationStore.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revolution',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      navigatorKey: NavigationStore.instance.navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: RouteNames.Splash,
    );
  }
}
