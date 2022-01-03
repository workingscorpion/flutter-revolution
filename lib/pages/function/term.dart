import 'package:flutter/material.dart';
import 'package:revolution/appRouter.dart';
import 'package:revolution/components/customWebview.dart';
import 'package:http/http.dart' as http;

class TermPage extends StatefulWidget {
  TermPage({this.url, this.title});

  final String url;
  final String title;

  @override
  _TermPageState createState() => _TermPageState();
}

class _TermPageState extends State<TermPage> {
  String body = "https://naver.com";

  @override
  void initState() {
    getBody();
    super.initState();
  }

  getBody() async {
    final response = await http.get(widget.url);
    body = response.body;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => AppRouter.pop(),
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomWebview(
          contents: body,
          htmlType: false,
        ),
      ),
    );
  }
}
