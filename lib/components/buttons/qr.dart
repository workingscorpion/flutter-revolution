import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class QRButton extends StatelessWidget {
  const QRButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'QR',
      image: 'assets/home/qr.png',
      onTap: () => AppRouter.toQRPage(),
    );
  }
}
