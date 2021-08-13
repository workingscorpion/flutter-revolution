import 'package:btrips/appRouter.dart';
import 'package:btrips/constants/routeNames.dart';
import 'package:btrips/store/navigationStore.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Btrips',
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
