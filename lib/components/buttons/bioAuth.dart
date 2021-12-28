import 'dart:io';

import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:revolution/utils/bioAuthManager.dart';
import 'package:revolution/utils/maskAlertManager.dart';

class BioAuthButton extends StatelessWidget {
  const BioAuthButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: '생채인증',
      image: 'assets/home/bioAuth.png',
      onTap: () async {
        final result = await BioAuthManager.auth();

        MaskAlertManager.showMaskAlert(
          context: context,
          icon: result ? Icons.check : Icons.cancel,
        );
      },
    );
  }
}
