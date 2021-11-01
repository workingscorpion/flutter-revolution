import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListViewCarousel extends StatefulWidget {
  ListViewCarousel({
    this.title,
    this.items,
    this.initialIndex,
    this.width,
    this.margin,
  });

  final String title;
  final List<Widget> items;
  final int initialIndex;
  final double width;
  final double margin;

  @override
  _ListViewCarouselState createState() => _ListViewCarouselState();
}

class _ListViewCarouselState extends State<ListViewCarousel> {
  final controller = ScrollController(keepScrollOffset: true);
  int carouselIndex = 0;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    carouselIndex = widget.initialIndex;
    setState(() {});

    controller
      ..addListener(() async {
        if (loading == true) {
          return;
        }
        loading = true;
        setState(() {});
        await move();
        loading = false;
        setState(() {});
      });
  }

  move() async {
    if (controller.position.userScrollDirection == ScrollDirection.forward) {
      await controller.animateTo(
        (widget.width * (carouselIndex - 1)) +
            ((carouselIndex - 1) * widget.margin),
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      carouselIndex--;
    }
    if (controller.position.userScrollDirection == ScrollDirection.reverse) {
      if (carouselIndex != widget.items.length - 1) {
        await controller.animateTo(
          (widget.width * (carouselIndex + 1)) +
              ((carouselIndex + 1) * widget.margin),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        carouselIndex++;
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title),
                indicators(),
              ],
            ),
          ),
          Container(
            height: 256,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              controller: controller,
              children: widget.items,
            ),
          ),
        ],
      ),
    );
  }

  Widget indicators() => Container(
        child: Row(
          children: widget.items
              .asMap()
              .map((index, e) => MapEntry(index, indicator(index)))
              .values
              .toList(),
        ),
      );

  Widget indicator(int index) => Container(
        height: 10,
        width: index == carouselIndex ? 20 : 10,
        margin:
            EdgeInsets.only(right: index == widget.items.length - 1 ? 0 : 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey, width: 1),
        ),
      );
}
