import 'package:flutter/material.dart';
import 'package:revolution/appRouter.dart';
import 'package:revolution/components/customBox.dart';

class ZoomPage extends StatefulWidget {
  ZoomPage({Key key}) : super(key: key);

  @override
  _ZoomPageState createState() => _ZoomPageState();
}

class _ZoomPageState extends State<ZoomPage> {
  final String image = 'assets/components/hedgehog.jpeg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Stack(
            children: [
              CustomBox(
                title: 'Zoom In & Out',
                child: GestureDetector(
                  onTap: () => AppRouter.toImagePage(image),
                  child: Hero(
                    tag: 'zoom',
                    child: Image.asset(image),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
