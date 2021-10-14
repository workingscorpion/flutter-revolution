import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:revolution/components/stampDialog.dart';
import 'package:revolution/constants/customColors.dart';
import 'package:flutter/material.dart';

class StampDialogButton extends StatelessWidget {
  const StampDialogButton({Key key}) : super(key: key);

  showStampDialog() async {
    await showDialog(
      context: AppRouter.context,
      barrierDismissible: true,
      child: StampDialog(
        stamp: '',
        topChild: topChild(),
        bottomChild: bottomChild(),
        stampColor: Colors.white,
        stampBackgroundColor: CustomColors.mainColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      image: 'assets/home/stampDialog.png',
      text: 'Stamp Dialog',
      onTap: () => showStampDialog(),
    );
  }

  topChild() => Container();
  bottomChild() => Container();
}
