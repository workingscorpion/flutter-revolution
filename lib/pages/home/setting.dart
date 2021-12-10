import 'package:flutter/material.dart';
import 'package:revolution/components/settings.dart';
import 'package:revolution/constants/customColors.dart';
import 'package:revolution/constants/routeNames.dart';
import 'package:revolution/model/settingModel.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<SettingGroupModel> menu = List<SettingGroupModel>();

  @override
  void initState() {
    super.initState();
    // menu.add(
    //   SettingGroupModel(
    //     title: 'MY NFT',
    //     settings: [
    //       SettingModel(
    //         name: '응모내역',
    //       ),
    //       SettingModel(
    //         name: '구매내역',
    //       ),
    //     ],
    //   ),
    // );
    menu.add(
      SettingGroupModel(
        title: '알림 설정',
        settings: [
          SettingModel(
            name: '공지 및 시시트메 알림 설정',
            agree: true,
          ),
          SettingModel(
            name: '광고 수신 알림 설정',
            agree: false,
          ),
        ],
      ),
    );
    menu.add(
      SettingGroupModel(
        title: '개인 설정',
        settings: [
          SettingModel(
            name: '개인 정보 변경',
            routeName: RouteNames.Auth,
          ),
          SettingModel(
            name: '비밀 번호 변경',
            routeName: RouteNames.Auth,
          ),
          SettingModel(
            name: 'KYC 등록',
            routeName: RouteNames.Auth,
          ),
          SettingModel(
            name: '지갑 주소 등록',
            routeName: RouteNames.Auth,
          ),
        ],
      ),
    );
    menu.add(
      SettingGroupModel(
        title: '고객 지원',
        subTexts: [
          'cs@btrips.io',
          '평일 10:00~18:00 주말/공휴일 휴무',
        ],
        settings: [
          SettingModel(
            name: '공지사항',
            routeName: RouteNames.Auth,
          ),
          SettingModel(
            name: '약관 및 정책',
            routeName: RouteNames.Auth,
          ),
          SettingModel(
            name: '이벤트',
            routeName: RouteNames.Auth,
          ),
          SettingModel(
            name: '문의하기',
            routeName: RouteNames.Auth,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      color: CustomColors.grayColor20,
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        children: menu.map((e) => Settings(settings: e)).toList(),
      ),
    );
  }
}
