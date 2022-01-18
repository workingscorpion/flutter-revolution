import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:revolution/appRouter.dart';
import 'package:revolution/components/customBox.dart';
import 'package:revolution/components/qr.dart';
import 'package:revolution/store/keyValueStore.dart';

class QRScanPage extends StatefulWidget {
  QRScanPage({Key key}) : super(key: key);

  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  TextEditingController controller = TextEditingController();

  submit() {
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
              child: Observer(
                builder: (context) => Text(
                  KeyValueStore.instance.scanData ?? "",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  scan() async {
    await AppRouter.toScanCameraPage();
  }
}
