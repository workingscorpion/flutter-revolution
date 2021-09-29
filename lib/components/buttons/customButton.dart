import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.onTap,
    this.text,
    this.image,
  });

  final String text;
  final Function onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        height: MediaQuery.of(context).size.height * .1,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(.5),
              BlendMode.darken,
            ),
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: image != null ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
