import 'dart:io';

import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:revolution/utils/maskAlertManager.dart';

class BioAuthButton extends StatelessWidget {
  const BioAuthButton({Key key}) : super(key: key);

  showMaskAlert(BuildContext context, bool success) async {
    MaskAlertManager.showMaskAlert(
      context: context,
      success: success,
    );
    // final scaffold = Scaffold.of(context);
    // scaffold.showBottomSheet(
    //   (context) => Container(
    //     child: Text('123'),
    //   ),
    // );
    // scaffold.showSnackBar(
    //   SnackBar(
    //     content: Text('Added to favourite'),
    //     action: SnackBarAction(
    //       label: 'UNDO',
    //       onPressed: scaffold.hideCurrentSnackBar,
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: '생채인증',
      image: 'assets/home/bioAuth.png',
      onTap: () async {
        // LocalAuthentication auth = LocalAuthentication();
        // bool canCheckBiometrics = await auth.canCheckBiometrics;
        // if (canCheckBiometrics) {
        //   List<BiometricType> availableBiometrics =
        //       await auth.getAvailableBiometrics();

        //   final result = await auth.authenticateWithBiometrics(
        //     localizedReason: '',
        //     iOSAuthStrings: IOSAuthMessages(),
        //     androidAuthStrings: AndroidAuthMessages(
        //       fingerprintHint: '지문 인식 설명',
        //       cancelButton: '취소',
        //       signInTitle: '지문 인식',
        //     ),
        //     stickyAuth: true,
        //   );

        await showMaskAlert(context, true);
        // showMaskAlert(context, result);

        // if (Platform.isIOS) {
        //   if (availableBiometrics.contains(BiometricType.face)) {
        //     // Face ID.
        //   } else if (availableBiometrics
        //       .contains(BiometricType.fingerprint)) {
        //     // Touch ID.
        //   }
        // }
        // }
      },
    );
  }
}
