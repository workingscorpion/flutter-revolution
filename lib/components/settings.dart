import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:revolution/constants/customColors.dart';
import 'package:revolution/constants/routeNames.dart';
import 'package:revolution/model/settingModel.dart';

class Settings extends StatefulWidget {
  Settings({this.settings});

  final SettingGroupModel settings;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  route(String routeName) {
    switch (routeName) {
      case RouteNames.Auth:
        Fluttertoast.showToast(msg: 'Auth Route');
        // AppRouter.to
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(.16),
        //     blurRadius: 6,
        //     offset: Offset(5.0, 0.0),
        //   ),
        // ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Text(
                    widget.settings.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  widget.settings.asset != null
                      ? SvgPicture.asset(widget.settings.asset)
                      : Container(),
                ],
              ),
            ),
          ],
          widget.settings.settings
              .asMap()
              .map((index, e) => MapEntry(index, setting(e, index)))
              .values,
          [
            widget.settings.subTexts != null &&
                    widget.settings.subTexts.length > 0
                ? Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:
                          widget.settings.subTexts.map((e) => Text(e)).toList(),
                    ),
                  )
                : Container(),
          ]
        ].expand((e) => e).toList(),
      ),
    );
  }

  Widget setting(SettingModel e, int index) => Container(
        margin: EdgeInsets.only(
          bottom: widget.settings.settings.length - 1 <= index ? 0 : 10,
        ),
        child: GestureDetector(
          onTap: () => route(e.routeName),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                e.name,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              e.agree != null
                  ? Transform.scale(
                      scale: .8,
                      child: CupertinoSwitch(
                        value: e.agree,
                        onChanged: (value) {
                          e.agree = value;
                          setState(() {});
                        },
                        activeColor: CustomColors.mainColor,
                      ),
                    )
                  : Container()
            ],
          )),
        ),
      );
}
