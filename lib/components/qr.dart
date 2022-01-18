import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QR extends StatelessWidget {
  const QR({
    this.data,
    this.version = 3,
    this.size = 170.0,
  });

  final String data;
  final int version;
  final double size;

  copy() {
    Clipboard.setData(ClipboardData(text: data));
    Fluttertoast.showToast(
      gravity: ToastGravity.BOTTOM,
      msg: "클립보드에 복사되었습니다.",
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => copy(),
      child: QrImage(
        data: data,
        version: version,
        size: size,
      ),
    );
  }
}
