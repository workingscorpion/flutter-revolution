import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:revolution/model/listItem.dart';
import 'package:revolution/store/infiniteScrollStore.dart';

class InfiniteScrollPage extends StatefulWidget {
  InfiniteScrollPage({Key key}) : super(key: key);

  @override
  _InfiniteScrollPageState createState() => _InfiniteScrollPageState();
}

class _InfiniteScrollPageState extends State<InfiniteScrollPage> {
  int page = 0;
  int size = 10;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    load();
    controller.addListener(() {
      // if()
      // print('controller.position.pixels: ${controller.position.pixels}');
      print('controller.offset: ${controller.offset}');
      print(
        'controller.position.maxScrollExtent: ${controller.position.maxScrollExtent}',
      );
    });
  }

  load({page = 1}) async {
    await InfiniteScrollStore.instance.load(page: page, size: size);

    Future.delayed(Duration(seconds: 1), () {
      print('controller.offset on Init: ${controller.offset}');
      print(
        'controller.position.maxScrollExtent on Init: ${controller.position.maxScrollExtent}',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => load(),
          child: Observer(
            builder: (context) => ListView(
              controller: controller,
              children: InfiniteScrollStore.instance.list
                  .map((e) => item(e))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget item(ListItem e) => Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
        ),
        child: Text('${e.title}'),
      );
}
