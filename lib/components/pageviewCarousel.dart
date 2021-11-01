import 'package:flutter/material.dart';

class PageViewCarousel extends StatefulWidget {
  PageViewCarousel({
    this.title,
    this.items,
    this.initialIndex,
  });

  final String title;
  final List<Widget> items;
  final int initialIndex;

  @override
  _PageViewCarouselState createState() => _PageViewCarouselState();
}

class _PageViewCarouselState extends State<PageViewCarousel> {
  final controller = PageController(
    viewportFraction: .74,
  );
  int carouselIndex = 0;

  @override
  void initState() {
    super.initState();
    carouselIndex = widget.initialIndex;
    setState(() {});
  }

  @override
  void dispose() {
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
            height: 500,
            child: PageView(
              controller: controller,
              children: widget.items,
              onPageChanged: (index) {
                carouselIndex = index;
                setState(() {});
              },
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
