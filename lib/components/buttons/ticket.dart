import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class TicketButton extends StatelessWidget {
  const TicketButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      image: 'assets/home/stampDialog.png',
      text: 'Ticket',
      onTap: () => AppRouter.toTicketPage(),
    );
  }
}
