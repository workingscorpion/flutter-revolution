import 'dart:async';

import 'package:flutter/material.dart';
import 'package:revolution/appRouter.dart';
import 'package:revolution/components/customBox.dart';
import 'package:revolution/constants/customColors.dart';

class SlideNoticePage extends StatefulWidget {
  SlideNoticePage({Key key}) : super(key: key);

  @override
  _SlideNoticePageState createState() => _SlideNoticePageState();
}

class _SlideNoticePageState extends State<SlideNoticePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Timer timer;
  int selectedIndex = 0;

  List<Notice> notices = List.generate(
    5,
    (index) => Notice(
      index: index,
      title: 'title $index',
      contents: 'contents $index',
      fix: true,
    ),
  );

  String get title {
    return notices.elementAt(selectedIndex).title;
  }

  String get next {
    return notices.elementAt((selectedIndex + 1) % notices.length).title;
  }

  @override
  void initState() {
    setController();

    timer = Timer.periodic(Duration(milliseconds: 3000), (timer) {
      controller.forward();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    controller.removeListener(() {});
    controller.dispose();
    animation.removeListener(() {});
    super.dispose();
  }

  setController() {
    controller =
        AnimationController(duration: Duration(milliseconds: 1000), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reset();
              selectedIndex = (selectedIndex + 1) % notices.length;
              setState(() {});
            }
          });

    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.ease,
    ))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 30,
          ),
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => AppRouter.pop(),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  size: 30,
                ),
              ),
            ),
            CustomBox(
              title: 'Slide Notice(Vertical)',
              child: slideNotices(),
            ),
          ],
        ),
      ),
    );
  }

  slideNotices() => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: CustomColors.disabledGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        // child: notice(),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.volume_mute_outlined,
                size: 30,
              ),
            ),
            Expanded(
              child: notice(),
            ),
          ],
        ),
      );

  // notice() => Text('123');

  notice() => Container(
        height: 30,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Stack(
          children: [
            prevNotice(),
            nextNotice(),
          ],
        ),
      );

  prevNotice() => Positioned(
        bottom: 50.0 * (animation.value / 1),
        child: Opacity(
          opacity: 1 - animation.value,
          child: text(title),
        ),
      );

  nextNotice() => Positioned(
        bottom: -1 * (1 - animation.value),
        child: Opacity(
          opacity: animation.value,
          child: text(next),
        ),
      );

  text(String value) => Container(
        width: MediaQuery.of(context).size.width,
        child: Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      );
}

class Notice {
  final int index;
  final String title;
  final String contents;
  final bool fix;

  const Notice({
    this.index,
    this.title,
    this.contents,
    this.fix,
  });
}
