import 'package:flutter/material.dart';
import 'package:revolution/components/customBox.dart';
import 'package:revolution/components/roulette.dart';
import 'package:revolution/model/rouletteData.dart';

class RoulettePage extends StatefulWidget {
  RoulettePage({Key key}) : super(key: key);

  @override
  _RoulettePageState createState() => _RoulettePageState();
}

class _RoulettePageState extends State<RoulettePage> {
  // final List<RouletteData> data = List.generate(
  //     4,
  //     (index) => RouletteData(
  //           title: (index + 1).toString(),
  //           percent: (index + 1) * 10.0,
  //         ));

  final List<RouletteData> data = [
    RouletteData(
      title: '이벤트1',
      percent: 20,
      color: Colors.red,
    ),
    RouletteData(
      title: '이벤트2',
      percent: 5,
      color: Colors.blue,
    ),
    RouletteData(
      title: '이벤트3',
      percent: 10,
      color: Colors.green,
    ),
    RouletteData(
      title: '이벤트4',
      percent: 40,
      color: Colors.yellow,
    ),
    RouletteData(
      title: '이벤트5',
      percent: 10,
      color: Colors.grey,
    ),
    RouletteData(
      title: '이벤트6',
      percent: 15,
      color: Colors.purple,
    ),
  ].toList();

  getColorName(RouletteData datum) {
    final colorCode = datum.color.value.toRadixString(16).toUpperCase();
    switch (colorCode) {
      case 'FFF44336':
        return 'red';
      case 'FF2196F3':
        return 'blue';
      case 'FF4CAF50':
        return 'green';
      case 'FFFFEB3B':
        return 'yellow';
      case 'FF9E9E9E':
        return 'grey';
      case 'FF9C27B0':
        return 'purple';
      default:
        return 'ext';
    }
  }

  showResult(RouletteData data) async {
    await showDialog(
      context: context,
      child: resultDialog(data),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          children: [
            CustomBox(
              title: 'Roulette',
              child: Roulette(
                data: data,
                onEnd: (RouletteData data) => showResult(data),
              ),
            ),
          ],
        ),
      ),
    );
  }

  resultDialog(RouletteData data) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Text('Congraturation'),
                  Text('You won ${data.title}'),
                  Text(getColorName(data)),
                  RaisedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('확인'),
                  )
                ],
              ),
            )),
      );
}
