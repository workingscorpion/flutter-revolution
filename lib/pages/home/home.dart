import 'package:btrips/constants/customColors.dart';
import 'package:btrips/pages/home/ui.dart';
import 'package:btrips/pages/home/function.dart';
import 'package:btrips/pages/home/setting.dart';
import 'package:flutter/material.dart';
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
      'icon': Icons.design_services,
      'label': 'UI',
    },
    {
      'icon': Icons.functions,
      'label': '기능',
    },
    {
      'icon': Icons.settings,
      'label': '설정',
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
          UIPage(),
          FunctionPage(),
          SettingPage(),
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
                child: Icon(
                  menus[index]['icon'],
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
