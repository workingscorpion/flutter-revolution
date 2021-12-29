import 'dart:io';

import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class BioAuthManager {
  static Future<bool> auth() async {
    LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    if (canCheckBiometrics) {
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();

      final result = await auth.authenticateWithBiometrics(
        localizedReason: '',
        iOSAuthStrings: IOSAuthMessages(),
        androidAuthStrings: AndroidAuthMessages(
          fingerprintHint: '지문 인식 설명',
          cancelButton: '취소',
          signInTitle: '지문 인식',
        ),
        stickyAuth: true,
      );

      print('result');
      print(result);

      if (Platform.isIOS) {
        if (availableBiometrics.contains(BiometricType.face)) {
          // Face ID.
          print('faceId');
        } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
          // Touch ID.
          print('touchId');
        }
        return false;
      } else {
        return result;
      }
    }
    return false;
  }
}
