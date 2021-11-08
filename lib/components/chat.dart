import 'package:flutter/material.dart';

class Chat<T> extends StatelessWidget {
  const Chat({this.items, this.builder});

  final List<T> items;
  final Function(T) builder;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 10),
      children: items
          .map(
            (e) => Container(
              child: builder(e),
            ),
          )
          .toList(),
    );
  }
}
