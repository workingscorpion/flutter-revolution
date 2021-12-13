import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class DynamicGridButton extends StatelessWidget {
  const DynamicGridButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Dynamic Grid',
      image: 'assets/home/grid.png',
      onTap: () => AppRouter.toGridPage(),
    );
  }
}
