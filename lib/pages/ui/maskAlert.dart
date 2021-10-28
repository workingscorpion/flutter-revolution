import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:revolution/utils/maskAlertManager.dart';

class MaskAlertPage extends StatefulWidget {
  MaskAlertPage({Key key}) : super(key: key);

  @override
  _MaskAlertPageState createState() => _MaskAlertPageState();
}

class _MaskAlertPageState extends State<MaskAlertPage> {
  bool like = false;

  showMaskAlert({
    BuildContext context,
    IconData icon,
    String image,
    Color color,
  }) async {
    MaskAlertManager.showMaskAlert(
      context: context,
      icon: icon,
      image: image,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => showMaskAlert(context: context, icon: Icons.check),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black54,
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.black54,
                  size: 30,
                ),
              ),
            ),
            Container(width: 30),
            GestureDetector(
              onTap: () => showMaskAlert(context: context, icon: Icons.close),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black54,
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.black54,
                  size: 30,
                ),
              ),
            ),
            Container(width: 30),
            GestureDetector(
              onTap: () {
                like = !like;
                setState(() {});
                showMaskAlert(
                  context: context,
                  color: Colors.red,
                  image: like
                      ? 'assets/components/heart.svg'
                      : 'assets/components/heart_empty.svg',
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black54,
                    width: 1,
                  ),
                ),
                child: SvgPicture.asset(
                  like
                      ? 'assets/components/heart.svg'
                      : 'assets/components/heart_empty.svg',
                  color: Colors.red,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
