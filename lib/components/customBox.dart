import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({
    this.child,
    this.title,
    this.icon,
  });

  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 50),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                icon != null
                    ? Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Icon(icon),
                      )
                    : Container(),
                title != null ? Text(title) : Container(),
              ],
            ),
          ),
          Center(child: child),
        ],
      ),
    );
  }
}
