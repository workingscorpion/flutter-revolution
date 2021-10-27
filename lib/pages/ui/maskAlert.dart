import 'package:flutter/material.dart';
import 'package:revolution/utils/maskAlertManager.dart';

class MaskAlertPage extends StatelessWidget {
  const MaskAlertPage({Key key}) : super(key: key);

  showMaskAlert(BuildContext context, IconData icon) async {
    MaskAlertManager.showMaskAlert(
      context: context,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => showMaskAlert(context, Icons.check),
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
            InkWell(
              onTap: () => showMaskAlert(context, Icons.close),
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
          ],
        ),
      ),
    );
  }
}
