import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Chat',
      image: 'assets/home/chat.png',
      onTap: () => AppRouter.toChatPage(),
    );
  }
}
