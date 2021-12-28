import 'package:revolution/components/buttons/bioAuth.dart';
import 'package:flutter/material.dart';
import 'package:revolution/components/buttons/infiniteScroll.dart';
import 'package:revolution/components/buttons/tapjoy.dart';

class FunctionPage extends StatefulWidget {
  FunctionPage({Key key}) : super(key: key);

  @override
  _FunctionPageState createState() => _FunctionPageState();
}

class _FunctionPageState extends State<FunctionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        children: [
          BioAuthButton(),
          InfiniteScrollButton(),
          TapjoyButton(),
          // TODO: textFormmating
        ],
      ),
    );
  }
}
