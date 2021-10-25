import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InfiniteScoll extends StatefulWidget {
  InfiniteScoll({
    this.reloadOffset,
    this.refresh,
    this.initLoad,
    this.loadMore,
    this.items,
    this.itemBuilder,
    this.spinColor = Colors.grey,
  });

  final double reloadOffset;
  final Function initLoad;
  final Function loadMore;
  final Function refresh;
  final List items;
  final Function itemBuilder;
  final Color spinColor;

  @override
  _InfiniteScollState createState() => _InfiniteScollState();
}

class _InfiniteScollState extends State<InfiniteScoll> {
  ScrollController controller = ScrollController();
  bool loading;
  bool refresh = false;

  double get offset {
    return controller.position.pixels / controller.position.maxScrollExtent;
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  initialize() async {
    widget.initLoad != null ? widget.initLoad() : widget.refresh();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (controller.position.maxScrollExtent == 0) {
        await load();
      }

      controller.addListener(() async {
        if (controller.position.maxScrollExtent == 0 || refresh) {
          await load();
          refresh = false;
          setState(() {});
        } else {
          if (offset > 1.0 - widget.reloadOffset) {
            await load();
          }
        }
      });
    });
  }

  load() async {
    if (loading == true) {
      return;
    }
    try {
      loading = true;
      setState(() {});
      await widget.loadMore();
    } finally {
      loading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await widget.refresh();
        refresh = true;
        setState(() {});
        controller.notifyListeners();
      },
      child: Observer(
        builder: (context) => ListView(
          controller: controller,
          children: [
            widget.items.length > 0
                ? ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: widget.items
                        .map((e) => Container(
                              child: widget.itemBuilder(e),
                            ))
                        .toList(),
                  )
                : Container(),
            loading == true
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Spin(
                        color: widget.spinColor,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class Spin extends StatelessWidget {
  Spin({
    this.color = Colors.grey,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}
