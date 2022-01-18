import 'package:flutter/material.dart';
import 'package:revolution/components/customBox.dart';
import 'package:revolution/components/qr.dart';

class QRPage extends StatefulWidget {
  QRPage({Key key}) : super(key: key);

  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
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
        child: Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            children: [
              input(),
              CustomBox(
                title: 'QR',
                child: QR(data: data),
              ),
            ],
          ),
        ),
      ),
    );
  }

  input() => Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: controller,
              onSubmitted: (String _) => submit(),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: 'QR Data',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: () => submit(),
            ),
          ),
        ],
      ));

  // Container(
  //       margin: EdgeInsets.only(bottom: 20),
  //       child: TextField(
  //         controller: controller,
  //         decoration: InputDecoration(
  //           focusedBorder: OutlineInputBorder(
  //             borderSide: BorderSide(color: Colors.black, width: 1.0),
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //           enabledBorder: OutlineInputBorder(
  //             borderSide: BorderSide(color: Colors.black, width: 1.0),
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //           hintText: 'QR Data',
  //         ),
  //       ),
  //     );
}
