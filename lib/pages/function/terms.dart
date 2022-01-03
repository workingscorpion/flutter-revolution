import 'package:flutter/material.dart';
import 'package:revolution/appRouter.dart';
import 'package:revolution/components/customBox.dart';
import 'package:revolution/constants/customColors.dart';
import 'package:revolution/model/term.dart';
import 'package:revolution/utils/parseTerm.dart';

class TermsPage extends StatefulWidget {
  TermsPage({Key key}) : super(key: key);

  @override
  _TermsPageState createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  final List<Term> domesticTerms = List<Term>();
  final List<Term> abroadTerms = List<Term>();

  bool domesticAllAgree = false;
  bool abroadAllAgree = false;

  final List<String> domesticTermTitles = [
    '서비스 이용약관',
    '개인정보 동의',
    '제3장 정보 제공 동의',
  ];

  final List<String> abroadTermTitles = [
    'Terms and Conditions',
    'Privacy Policy1',
    'Privacy Policy2',
  ];

  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() {
    initDomesticTerms();
    initAbroadTerms();
  }

  initDomesticTerms() {
    domesticTerms.add(
      Term(
        checked: false,
        require: true,
        title: '만 19세 이상입니다.',
        showDetail: false,
      ),
    );

    domesticTerms.addAll(
      List<Term>.generate(
        3,
        (index) => Term(
          checked: false,
          require: true,
          title: domesticTermTitles.elementAt(index),
          showDetail: true,
          detail: 'https://naver.com',
        ),
      ),
    );

    domesticTerms.add(
      Term(
        checked: false,
        require: false,
        title: '마케팅정보 알림 동의',
        showDetail: true,
        detail: 'https://naver.com',
      ),
    );
  }

  initAbroadTerms() {
    abroadTerms.addAll(
      List<Term>.generate(
        3,
        (index) => Term(
          checked: false,
          require: true,
          title: abroadTermTitles.elementAt(index),
          showDetail: true,
          detail: 'https://naver.com',
        ),
      ),
    );

    abroadTerms.add(
      Term(
        checked: false,
        require: false,
        title: '마케팅정보 알림 동의',
        showDetail: true,
        detail: 'https://naver.com',
      ),
    );
  }

  check(int index, bool domestic) {
    if (domestic) {
      domesticTerms.elementAt(index).checked =
          !domesticTerms.elementAt(index).checked;
      if (domesticAllAgree &&
          domesticTerms.where((element) => !element.checked).length > 0) {
        domesticAllAgree = false;
      }
      if (!domesticAllAgree &&
          domesticTerms.where((element) => !element.checked).length <= 0) {
        domesticAllAgree = true;
      }
    } else {
      abroadTerms.elementAt(index).checked =
          !abroadTerms.elementAt(index).checked;
      if (abroadAllAgree &&
          abroadTerms.where((element) => !element.checked).length > 0) {
        abroadAllAgree = false;
      }
      if (!abroadAllAgree &&
          abroadTerms.where((element) => !element.checked).length <= 0) {
        abroadAllAgree = true;
      }
    }

    setState(() {});
  }

  allCheck(bool domestic) {
    if (domestic) {
      domesticAllAgree = !domesticAllAgree;
      final result = [...domesticTerms].map((e) => Term(
            checked: domesticAllAgree,
            require: e.require,
            title: e.title,
          ));
      domesticTerms
        ..clear()
        ..addAll(result);
    } else {
      abroadAllAgree = !abroadAllAgree;
      final result = [...abroadTerms].map((e) => Term(
            checked: abroadAllAgree,
            require: e.require,
            title: e.title,
          ));
      abroadTerms
        ..clear()
        ..addAll(result);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            CustomBox(
              title: 'Terms & Conditions(Abroad)',
              child: Column(
                  children: [
                [
                  all(
                    domestic: false,
                  )
                ],
                abroadTerms
                    .asMap()
                    .map(
                      (index, e) => MapEntry(
                        index,
                        term(item: e, index: index, domestic: false),
                      ),
                    )
                    .values
                    .toList(),
                [
                  Text(
                      'Binary : ${ParseTerm.toBinary(abroadTerms.map((e) => e.checked))}'),
                ],
              ].expand((e) => e).toList()),
            ),
            CustomBox(
              title: 'Terms & Conditions(Domestic)',
              child: Column(
                  children: [
                [
                  all(
                    domestic: true,
                  )
                ],
                domesticTerms
                    .asMap()
                    .map(
                      (index, e) => MapEntry(
                        index,
                        term(item: e, index: index, domestic: true),
                      ),
                    )
                    .values
                    .toList(),
                [
                  Text(
                      'Binary : ${ParseTerm.toBinary(domesticTerms.map((e) => e.checked))}'),
                ],
              ].expand((e) => e).toList()),
            ),
          ],
        ),
      ),
    );
  }

  Widget all({bool domestic = false}) => GestureDetector(
        onTap: () => allCheck(domestic),
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 24),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            color: CustomColors.grayColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () => allCheck(domestic),
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: domestic
                            ? domesticAllAgree
                                ? CustomColors.mainColor
                                : CustomColors.disabledGrey
                            : abroadAllAgree
                                ? CustomColors.mainColor
                                : CustomColors.disabledGrey,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  'Agree all',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 17,
                      ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget term({Term item, int index, bool domestic = false}) => Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  item.checked = !item.checked;
                  setState(() {});
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () => check(index, domestic),
                        child: Container(
                          // padding: EdgeInsets.all(10),
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: item.checked
                                ? CustomColors.mainColor
                                : CustomColors.disabledGrey,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '${requireCheck(item.require, domestic) != "" ? [
                            requireCheck(item.require, domestic)
                          ] : ""} ${item.title}',
                        style: TextStyle(),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            item.showDetail == true
                ? InkWell(
                    onTap: () => AppRouter.toTermPage(
                      item.detail,
                      item.title,
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: CustomColors.disabledGrey,
                      size: 25,
                    ),
                  )
                : Container(),
          ],
        ),
      );

  String requireCheck(bool require, bool domestic) {
    if (require) {
      return domestic ? "필수" : '';
    }
    return domestic ? "선택" : "Optional";
  }
}
