import 'package:revolution/components/buttons/bioAuth.dart';
import 'package:flutter/material.dart';
import 'package:revolution/components/buttons/infiniteScroll.dart';
import 'package:revolution/components/buttons/tapjoy.dart';
import 'package:revolution/components/buttons/term.dart';
import 'package:revolution/components/buttons/qr.dart';
import 'package:revolution/components/buttons/qrscan.dart';
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
      padding: EdgeInsets.symmetric(vertical: 60),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        children: [
          BioAuthButton(),
          InfiniteScrollButton(),
          TapjoyButton(),
          TermButton(),
          // TODO: textFormmating
          // TODO: moor DB
          // TODO: hive DB
          // TODO: card scanner => https://pub.dev/packages/card_scanner
          // TODO: heat map analytics => https://pub.dev/packages/round_spot
          // TODO: appsfly
          // TODO: KYC
          // TODO: OTP
                QRButton(),
                QRScanButton(),
        ],
      ),
    );
  }
}
