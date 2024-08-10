import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';

class InPoutChat extends StatefulWidget {
  const InPoutChat({super.key});

  @override
  State<InPoutChat> createState() => _InPoutChatState();
}

final TextEditingController message = TextEditingController();

class _InPoutChatState extends State<InPoutChat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: SizeConfig.screenWidth! * 0.05,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(20)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_upward,
                    color: colorSplash,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.screenWidth! * 0.8,
              child: TextField(
                style: const TextStyle(color: colorwhite),
                controller: message,
                decoration: const InputDecoration(
                    hintText: "الأشعار",
                    hintStyle: TextStyle(color: colorwhite),
                    filled: true,
                    fillColor: bgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: SizeConfig.screenWidth! * 0.05,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: bgColor,
                  hoverColor: colorbody,
                  child: const Icon(Icons.add),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
