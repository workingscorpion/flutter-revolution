import 'package:revolution/components/buttons/bioAuth.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class FunctionPage extends StatefulWidget {
  FunctionPage({Key key}) : super(key: key);

  @override
  _FunctionPageState createState() => _FunctionPageState();
}

class _FunctionPageState extends State<FunctionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        children: [
          StickyHeader(
            // overlapHeaders: ,
            header: Container(
              height: 50.0,
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(Icons.functions),
                  Text('Function'),
                ],
              ),
            ),
            content: ListView(
              shrinkWrap: true,
              children: [
                BioAuthButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
