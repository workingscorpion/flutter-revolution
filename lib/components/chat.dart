import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Chat<T> extends StatelessWidget {
  const Chat({this.items, this.builder, this.controller});

  final List<T> items;
  final Function(T, int) builder;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => ListView(
        controller: controller,
        padding: EdgeInsets.symmetric(vertical: 10),
        children: items
            .asMap()
            .map(
              (index, e) => MapEntry(
                index,
                Container(
                  child: builder(e, index),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
