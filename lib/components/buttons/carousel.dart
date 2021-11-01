import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class CarouselButton extends StatelessWidget {
  const CarouselButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Carousel Slider',
      image: 'assets/home/carousel.png',
      onTap: () => AppRouter.toCarouselPage(),
    );
  }
}
