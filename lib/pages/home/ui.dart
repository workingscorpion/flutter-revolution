import 'package:revolution/components/buttons/carousel.dart';
import 'package:revolution/components/buttons/dynamicGrid.dart';
import 'package:revolution/components/buttons/hero.dart';
import 'package:revolution/components/buttons/lottery.dart';
import 'package:revolution/components/buttons/maskAlert.dart';
import 'package:revolution/components/buttons/pin.dart';
import 'package:revolution/components/buttons/progressBar.dart';
import 'package:revolution/components/buttons/loadingIndicator.dart';
import 'package:revolution/components/buttons/roulette.dart';
import 'package:revolution/components/buttons/timer.dart';
import 'package:revolution/components/buttons/ticket.dart';
import 'package:flutter/material.dart';
import 'package:revolution/components/buttons/video.dart';

class UIPage extends StatefulWidget {
  UIPage({Key key}) : super(key: key);

  @override
  _UIPageState createState() => _UIPageState();
}

class _UIPageState extends State<UIPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
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
          LotteryButton(),
          VideoButton(),
          DynamicGridButton(),
          HeroButton(),
          PinButton(),
          // TODO: number sliding animation with formatting
          // TODO: 토스트 자체 제작
          // TODO: snackbar
          // TODO: custom switch(from 유진쓰)
          // TODO: 고정된 component 사이에 자동으로 margin 주는 ui(마지막은 margin 없게)
          // TODO: chatting ui
          // TODO: 출석체크
          // TODO: 숨은 그림 찾기(빼꼼 나온 캐릭터나 알파벳 클릭하면 슬쩍 나와서 사라진당)
          // TODO: 4조각 퍼즐
          // TODO: 공룡알 누르면 랜덤 당첨금 나오는 뽑기
          // TODO: 홀짝(오징어 게임)
          // TODO: 특정 조건을 만족하면 실행되는 아이폰 에어드랍 UI 스타일을 가진 에어드랍 이벤트
          // TODO: OX퀴즈 이벤트
          // TODO: text style custom
          // TODO: 로고 매니저
        ],
      ),
    );
  }
}
