import 'package:btrips/appRouter.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 2000), () {
      AppRouter.toHomePage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(right: 10),
                    child: Image.asset(
                      'assets/logo/logo.png',
                    ),
                  ),
                  Text(
                    'BTRIPS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
            ),
            Text(
              '암호화폐 정보를 한눈에',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
            Text(
              '비트립스',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
