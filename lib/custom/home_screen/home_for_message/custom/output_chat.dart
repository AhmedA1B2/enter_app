import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:flutter/material.dart';

class OutputChat extends StatefulWidget {
  const OutputChat({super.key});

  @override
  State<OutputChat> createState() => _OutputChatState();
}

class _OutputChatState extends State<OutputChat> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            Material(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
                topRight: Radius.circular(80),
                bottomRight: Radius.circular(80),
              ),
              color: colorSplash,
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'هذا مثال عن شكل الرسائل',
                  style: TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
