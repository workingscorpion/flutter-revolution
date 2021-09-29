import 'package:btrips/components/bioAuthButton.dart';
import 'package:btrips/constants/customButton.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        children: [
          // StickyHeader(
          //   header: Container(
          //     height: 50.0,
          //     // decoration: BoxDecoration(
          //     //   borderRadius: BorderRadius.only(
          //     //     topLeft: Radius.circular(8),
          //     //     topRight: Radius.circular(8),
          //     //   ),
          //     // ),
          //     margin: EdgeInsets.only(bottom: 10),
          //     alignment: Alignment.centerLeft,
          //     child: Row(
          //       children: [
          //         Icon(Icons.design_services),
          //         Text('UI'),
          //       ],
          //     ),
          //   ),
          //   content: ListView(
          //     shrinkWrap: true,
          //     children: [
          //     ],
          //   ),
          // ),

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
