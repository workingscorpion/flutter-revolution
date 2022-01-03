import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class TermButton extends StatelessWidget {
  const TermButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Terms',
      image: 'assets/home/terms.png',
      onTap: () => AppRouter.toTermsPage(),
    );
  }
}
