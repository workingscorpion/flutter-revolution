import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class SlideNoticeButton extends StatelessWidget {
  const SlideNoticeButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'SlideNotice',
      image: 'assets/home/slideNotice.png',
      onTap: () => AppRouter.toSlideNoticePage(),
    );
  }
}
