import 'package:enter_sirte_university_php/custom/home_screen/home_for_message/custom/input_chat.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_message/custom/output_chat.dart';
import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';

class Send extends StatefulWidget {
  const Send({super.key});

  @override
  State<Send> createState() => _SendState();
}

class _SendState extends State<Send> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: SizeConfig.screenHeight! * 0.73,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.1,
                blurStyle: BlurStyle.outer,
                color: bgColor,
              ),
            ],
          ),
          child: const OutputChat(),
        ),
        const InPoutChat(),
        const Spacer(),
      ],
    );
  }
}
