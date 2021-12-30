import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:revolution/components/customBox.dart';

class AdaptiveColorPage extends StatefulWidget {
  AdaptiveColorPage({Key key}) : super(key: key);

  @override
  _AdaptiveColorPageState createState() => _AdaptiveColorPageState();
}

class _AdaptiveColorPageState extends State<AdaptiveColorPage> {
  Color textColor = Colors.white;
  List<String> images = List();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    images.add('assets/home/hero.png');
    images.add('assets/components/black.png');
    images.add('assets/components/white.png');
    images.add(
        'https://workingscorpion.s3.ap-northeast-2.amazonaws.com/revolution/images/hedgehog.jpg');
    initialize();
  }

  initialize() async {
    textColor = await analysisImage();
    setState(() {});
  }

  bool isNetworkImage() {
    return (images.elementAt(selectedIndex).contains('https://') ||
            images.elementAt(selectedIndex).contains('http://'))
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          children: [
            CustomBox(
              title: 'White Background',
              child: Container(
                child: child(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  child() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Builder(
                builder: (context) => isNetworkImage()
                    ? Image.network(images.elementAt(selectedIndex))
                    : Image.asset(
                        images.elementAt(selectedIndex),
                        fit: BoxFit.fitWidth,
                      ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 10, left: 10),
                height: 150,
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: textColor,
                  size: 30,
                )),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  selectedIndex--;
                  if (selectedIndex <= 0) {
                    selectedIndex = 0;
                  }
                  initialize();
                  setState(() {});
                },
                child: Icon(
                  Icons.keyboard_arrow_left,
                  size: 30,
                ),
              ),
            ),
            Container(
              width: 20,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  selectedIndex++;
                  if (selectedIndex >= images.length) {
                    selectedIndex = images.length;
                  }
                  initialize();
                  setState(() {});
                },
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<Color> analysisImage() async {
    final image = images.elementAt(selectedIndex);
    PaletteGenerator palette = await PaletteGenerator.fromImageProvider(
      isNetworkImage() ? NetworkImage(image) : AssetImage(image),

      // Images are square
      size: Size(150, 150),

      // I want the dominant color of the top left section of the image
      // region: Offset.zero & Size(40, 40),
      maximumColorCount: 5,
    );

    // print(palette);

    // final bgColor = Image.asset(image).color;
    // print(bgColor);

    Color dominantColor = palette.dominantColor?.color;

    print(dominantColor);
    // // // Here's the probl
    // // // Sometimes dominantColor returns null
    // // // With black and white background colors in my tests
    if (dominantColor == null) return Colors.black;

    return dominantColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    // return useWhiteForeground(dominantColor);
  }
}
