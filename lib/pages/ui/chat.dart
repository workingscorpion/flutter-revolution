import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revolution/components/chat.dart';
import 'package:revolution/model/chatItem.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatItem> chats = List<ChatItem>();

  bool mine(ChatItem chat) {
    return chat.writer == "me" ? true : false;
  }

  @override
  void initState() {
    chats = List.generate(
      100,
      (index) => ChatItem(
        writer: index % 2 == 1 ? 'you' : 'me',
        createdTime: DateTime.now().add(Duration(minutes: index * 1)),
        contents: 'contents $index',
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Stack(
                children: [
                  Chat<ChatItem>(
                    items: chats,
                    builder: (ChatItem chat) => chatBuilder(chat),
                  ),
                  header(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.red,
                child: Text('input'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chatBuilder(ChatItem chat) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment:
              mine(chat) ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: mine(chat)
              ? [
                  time(chat, mine(chat)),
                  contents(chat),
                ]
              : [
                  profile(chat),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      writer(chat),
                      Row(
                        children: [
                          contents(chat),
                          time(chat, mine(chat)),
                        ],
                      ),
                    ],
                  ),
                ],
        ),
      );

  profile(ChatItem chat) => Container(
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            'https://workingscorpion.s3.ap-northeast-2.amazonaws.com/revolution/images/hedgehog.jpg',
            height: 40,
            width: 40,
          ),
        ),
      );

  writer(ChatItem chat) => Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Text(chat.writer),
      );

  contents(ChatItem chat) => Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: mine(chat) ? Colors.yellow : Colors.white,
        ),
        child: Text(
          '${chat.contents}',
          style: TextStyle(fontSize: 15),
        ),
      );

  time(ChatItem chat, bool mine) => Container(
        margin:
            EdgeInsets.only(top: 10, left: mine ? 0 : 5, right: mine ? 5 : 0),
        alignment: Alignment.bottomLeft,
        child: Text(
          DateFormat('a hh:mm').format(chat.createdTime),
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      );

  Widget header() => Container(
        color: Colors.white.withOpacity(.8),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.keyboard_arrow_left),
            Text('you'),
            Row(
              children: [
                Icon(Icons.search),
                Container(
                  width: 10,
                ),
                Icon(Icons.menu),
              ],
            ),
          ],
        ),
      );
}
