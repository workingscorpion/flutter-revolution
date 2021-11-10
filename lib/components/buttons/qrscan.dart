import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class QRScanButton extends StatelessWidget {
  const QRScanButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'QRScan',
      image: 'assets/home/qrscan.png',
      onTap: () => AppRouter.toQRScanPage(),
    );
  }
}
