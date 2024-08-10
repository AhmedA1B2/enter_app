import 'package:enter_sirte_university_php/custom/home_screen/code.dart';
import 'package:enter_sirte_university_php/custom/home_screen/widget/drawer.dart';
import 'package:flutter/material.dart';

class GoToCode extends StatelessWidget {
  const GoToCode({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Code()));
                },
                child: const CustomDrawer(textdrawer: 'ادخل الماده'));
  }
}