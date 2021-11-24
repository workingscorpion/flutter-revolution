import 'package:flutter/material.dart';
import 'package:revolution/components/infiniteScroll.dart';
import 'package:revolution/model/listItem.dart';
import 'package:revolution/store/infiniteScrollStore.dart';

class InfiniteScrollPage extends StatefulWidget {
  InfiniteScrollPage({Key key}) : super(key: key);

  @override
  _InfiniteScrollPageState createState() => _InfiniteScrollPageState();
}

class _InfiniteScrollPageState extends State<InfiniteScrollPage> {
  int page = 1;
  int size = 10;
  double reloadOffset = .3;

  load({bool refresh = false}) async {
    if (InfiniteScrollStore.instance.loading != true) {
      if (refresh) {
        page = 1;
      } else {
        page++;
      }
      await InfiniteScrollStore.instance.load(
        page: page ?? 1,
        size: size ?? 10,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: InfiniteScoll(
          refresh: () => load(refresh: true),
          loadMore: () => load(),
          reloadOffset: reloadOffset,
          items: InfiniteScrollStore.instance.list,
          itemBuilder: (ListItem e) => item(e),
          spinColor: Colors.grey,
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
