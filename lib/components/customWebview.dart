import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:revolution/utils/htmlManager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebview extends StatefulWidget {
  CustomWebview({
    this.contents,
    this.htmlType = false,
  });

  final String contents;
  final bool htmlType;

  @override
  _CustomWebviewState createState() => _CustomWebviewState();
}

class _CustomWebviewState extends State<CustomWebview> {
  String url;

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    parse();
  }

  String _html() {
    return HTMLManager.toHTML(widget.contents);
  }

  parse() {
    final html = _html();
    final data = base64.encode(utf8.encode(html));
    url = 'data:text/html;base64,$data';
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant CustomWebview oldWidget) {
    parse();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.htmlType
        ? Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * .75,
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              debuggingEnabled: false,
              gestureRecognizers: Set()
                ..add(
                  Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer(),
                  ),
                ),
            ),
          )
        : WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          );
  }
}
