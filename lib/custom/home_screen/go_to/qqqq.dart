import 'package:enter_sirte_university_php/custom/home_screen/qqqq.dart';
import 'package:enter_sirte_university_php/custom/home_screen/widget/drawer.dart';
import 'package:flutter/material.dart';

class GoToQqqq extends StatelessWidget {
  const GoToQqqq({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Qqqq()));
                },
                child: const CustomDrawer(textdrawer: 'النتائج'));
  }
}