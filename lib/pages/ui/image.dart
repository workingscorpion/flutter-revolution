import 'package:flutter/material.dart';
import 'package:revolution/appRouter.dart';

class ImagePage extends StatefulWidget {
  ImagePage({this.image});

  final String image;

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  double position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: 'zoom',
          child: GestureDetector(
            // onVerticalDragStart: (detail) {
            //   print('start');
            //   print(detail);
            // },
            // onVerticalDragEnd: (detail) {
            //   print('end');
            //   print(detail);
            // },
            // onTapDown: (detail){
            //   print
            // },
            onVerticalDragUpdate: (detail) {
              // print(detail.localPosition);
              // print(detail.globalPosition);
              if (detail.delta.dy >= 10) {
                AppRouter.pop();
              }
            },
            onDoubleTap: () => AppRouter.pop(),
            child: InteractiveViewer(
              panEnabled: true,
              minScale: 0.5,
              maxScale: 2,
              child: Image.asset(widget.image),
              boundaryMargin: EdgeInsets.all(10),
            ),
          ),
        ),
      ),
    );
  }
}
