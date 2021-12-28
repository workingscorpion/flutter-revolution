import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revolution/appRouter.dart';
import 'package:revolution/components/chat.dart';
import 'package:revolution/constants/customColors.dart';
import 'package:revolution/model/chatItem.dart';
import 'package:revolution/store/chatStore.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ScrollController controller = ScrollController();

  TextEditingController chatController = TextEditingController();
  FocusNode focus = FocusNode();

  bool mine(ChatItem chat) {
    return chat.writer == "me" ? true : false;
  }

  @override
  void initState() {
    load();
    super.initState();
    // controller.addListener(() {
    //   print('listener');
    // });

    WidgetsBinding.instance.addPostFrameCallback((_) => toBottom());
  }

  load() async {
    await ChatStore.instance.load();
  }

  toBottom() {
    controller.jumpTo(controller.position.maxScrollExtent);
  }

  send() async {
    if (chatController.text != "") {
      await ChatStore.instance.send(
        ChatItem(
          contents: chatController.text,
          createdTime: DateTime.now(),
          writer: 'me',
        ),
      );
    }
    chatController.clear();
    focus.requestFocus();
    WidgetsBinding.instance.addPostFrameCallback((_) => toBottom());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 90),
            child: Stack(
              children: [
                body(),
                header(),
              ],
            ),
          ),
          input(),
        ],
      ),
    );
  }

  Widget body() => Chat<ChatItem>(
        items: ChatStore.instance.chats,
        builder: (ChatItem chat, int index) => chatBuilder(chat, index),
        controller: controller,
      );

  Widget chatBuilder(ChatItem chat, int index) => Container(
        padding: index == 0
            ? EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 5)
            : EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => AppRouter.pop(),
              child: Icon(Icons.keyboard_arrow_left),
            ),
            Text('you'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
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

  Widget input() => Positioned(
        bottom: 0,
        height: MediaQuery.of(context).viewInsets.bottom == 0 ? 100 : 50,
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: EdgeInsets.only(bottom: 5),
          // alignment: Alignment.centerLeft,
          // padding: EdgeInsets.only(bottom: 50),
          height: 50,
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'messege',
              hintStyle: TextStyle(
                color: CustomColors.disabledGrey,
                fontSize: 14,
              ),
              focusedBorder: inputBorder(focus: true),
              enabledBorder: inputBorder(),
              border: inputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              suffix: sendButton(),
            ),
            controller: chatController,
            focusNode: focus,
            onSubmitted: (_) => send(),
          ),
        ),
      );

  sendButton() => GestureDetector(
        onTap: () => send(),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.yellow,
          ),
          child: Icon(
            Icons.arrow_upward,
            size: 18,
          ),
        ),
      );

  inputBorder({focus = false}) => UnderlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide.none,
      );
}
