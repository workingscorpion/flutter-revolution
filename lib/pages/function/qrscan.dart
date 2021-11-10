import 'package:flutter/material.dart';
import 'package:revolution/appRouter.dart';
import 'package:revolution/components/customBox.dart';
import 'package:revolution/components/qr.dart';

class QRScanPage extends StatefulWidget {
  QRScanPage({Key key}) : super(key: key);

  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  TextEditingController controller = TextEditingController();
  String data = "";

  submit() {
    data = controller.text;
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => scan(),
                    child: Text('scan'),
                  ),
                ),
              ),
            ),
            Container(
              child: Text(data),
            )
          ],
        ),
      ),
    );
  }

  scan() async {
    final String result = await AppRouter.toScanCameraPage();
    data = result;
    setState(() {});
  }
}
