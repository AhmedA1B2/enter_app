import 'package:enter_sirte_university_php/custom/home_screen/chat.dart';
import 'package:enter_sirte_university_php/custom/home_screen/widget/drawer.dart';
import 'package:flutter/material.dart';

class GoToChat extends StatelessWidget {
  const GoToChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Chat()));
        },
        child: const CustomDrawer(textdrawer: 'اعلان أو رسالة للطلبة'));
  }
}
