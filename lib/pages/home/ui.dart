import 'package:revolution/components/buttons/carousel.dart';
import 'package:revolution/components/buttons/maskAlert.dart';
import 'package:revolution/components/buttons/progressBar.dart';
import 'package:revolution/components/buttons/progressIndicator.dart';
import 'package:revolution/components/buttons/roulette.dart';
import 'package:revolution/components/buttons/timer.dart';
import 'package:revolution/components/buttons/ticket.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class UIPage extends StatefulWidget {
  UIPage({Key key}) : super(key: key);

  @override
  _UIPageState createState() => _UIPageState();
}

class _UIPageState extends State<UIPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        children: [
          ProgressBarButton(),
          ProgressIndicatorButton(),
          TimerButton(),
          TicketButton(),
          MaskAlertButton(),
          CarouselButton(),
          RouletteButton(),
          // TODO: number sliding animation with formatting
          // TODO: 토스트 자체 제작
          // TODO: snackbar
          // TODO: custom switch(from 유진쓰)
          // TODO: 고정된 component 사이에 자동으로 margin 주는 ui(마지막은 margin 없게)
          // TODO: chatting ui
                // TODO: carousel like medium icon(3d)
        ],
      ),
    );
  }
}
