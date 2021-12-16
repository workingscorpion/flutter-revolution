import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  GridPage({Key key}) : super(key: key);

  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  int crossAxisCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onScaleUpdate: (details) {
            final scale = details.scale;
            if (details.scale == 1.0) {
              return;
            } else if (scale < 1.0) {
              crossAxisCount = 4;
            } else {
              crossAxisCount = 3;
            }
            setState(() {});
          },
          child: GridView.count(
            padding: EdgeInsets.symmetric(vertical: 40),
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            children: List.generate(
              120,
              (index) => Container(
                alignment: Alignment.center,
                color: Colors.blue,
                child: Text('Item ${index + 1}'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
