import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  Tab1({Key key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  final String value = 'dsa6sd7f4asd89f6asd5sd7f5s8d75sd78f5';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('1'),
        ],
      ),
    );
  }
}
