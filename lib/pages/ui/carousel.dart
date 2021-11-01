import 'package:flutter/material.dart';
import 'package:revolution/components/listviewCarousel.dart';
import 'package:revolution/components/pageviewCarousel.dart';
import 'package:revolution/components/customBox.dart';

class CarouselPage extends StatefulWidget {
  CarouselPage({Key key}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  final storage =
      "https://workingscorpion.s3.ap-northeast-2.amazonaws.com/revolution/images/";

  List<CarouselItem> list;

  String titles(int index) {
    return index % 3 == 1
        ? 'hedgehog'
        : index % 3 == 2
            ? 'scorpion'
            : 'test';
  }

  @override
  void initState() {
    list = List.generate(
      5,
      (index) => CarouselItem(
        title: titles(index),
        image: '$storage${titles(index)}.jpg',
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            CustomBox(
              // title: 'ListView Carousel',
              child: ListViewCarousel(
                title: 'ListView Carousel',
                items: list.map((e) => image(e)).toList(),
                initialIndex: 0,
                width: 256,
                margin: 15,
              ),
            ),
            CustomBox(
              // title: 'PageView Carousel',
              child: PageViewCarousel(
                title: 'PageView Carousel',
                items: list.map((e) => item(e)).toList(),
                initialIndex: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget image(CarouselItem e) => Container(
        margin: EdgeInsets.only(right: 15),
        child: Image.network(
          e.image,
          fit: BoxFit.cover,
          width: 256,
          height: 256,
          alignment: Alignment.centerLeft,
        ),
      );

  Widget item(CarouselItem e) => IntrinsicWidth(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          margin: EdgeInsets.only(bottom: 30, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(e.title),
              ),
              Container(
                child: Image.network(
                  e.image,
                  fit: BoxFit.cover,
                  width: 256,
                  height: 256,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
        ),
      );
}

class CarouselItem {
  final String title;
  final String image;

  CarouselItem({this.title, this.image});
}
