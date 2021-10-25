import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class InfiniteScrollButton extends StatelessWidget {
  const InfiniteScrollButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: '무한 스크롤',
      image: 'assets/home/infiniteScroll.png',
      onTap: () => AppRouter.toInifiteScrollPage(),
    );
  }
}
