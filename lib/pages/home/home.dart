import 'package:btrips/constants/customColors.dart';
import 'package:btrips/pages/home/tab1.dart';
import 'package:btrips/pages/home/tab2.dart';
import 'package:btrips/pages/home/tab3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  DateTime _backPressDuration;

  final List menus = [
    {
      'icon': 'assets/icons/home.svg',
      'label': '홈',
    },
    {
      'icon': 'assets/icons/wallet.svg',
      'label': '지갑',
    },
    {
      'icon': 'assets/icons/user.svg',
      'label': '정보',
    },
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(
      vsync: this,
      initialIndex: 0,
      length: 3,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (_backPressDuration == null ||
        now.difference(_backPressDuration) > Duration(seconds: 2)) {
      _backPressDuration = now;
      Fluttertoast.showToast(
        msg: "'뒤로'버튼 한번 더 누르시면 종료됩니다.",
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(
          child: Container(
            child: body(),
          ),
        ),
      ),
      bottomNavigationBar: navigator(),
    );
  }

  body() => TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Tab1(),
          TabTab(),
          TabTabTab(),
        ],
      );

  navigator() => BottomNavigationBar(
        onTap: (index) {
          controller?.animateTo(index, duration: Duration(milliseconds: 75));
          setState(() {});
        },
        currentIndex: controller.index,
        backgroundColor: Colors.white,
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: CustomColors.mainColor,
        unselectedItemColor: CustomColors.disabledGrey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: [
          ...List.generate(
            menus.length,
            (index) => BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 2),
                // child: SvgPicture.asset(
                //   menus[index]['icon'],
                //   color: controller.index == index
                //       ? CustomColors.mainColor
                //       : CustomColors.disabledGrey,
                // ),
                child: Icon(
                  Icons.home,
                  color: controller.index == index
                      ? CustomColors.mainColor
                      : CustomColors.disabledGrey,
                ),
              ),
              label: menus[index]['label'],
            ),
          ),
        ],
      );
}
