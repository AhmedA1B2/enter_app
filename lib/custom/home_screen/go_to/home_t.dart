import 'package:enter_sirte_university_php/custom/home_screen/home_t.dart';
import 'package:enter_sirte_university_php/custom/home_screen/widget/drawer.dart';
import 'package:flutter/material.dart';

class GoToHomeTe extends StatelessWidget {
  const GoToHomeTe({super.key});

  @override
  Widget build(BuildContext context) {
    return  
            MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HomeTe()));
                },
                child: const CustomDrawer(textdrawer: "ادخال بيانات عضو هيئه التدريس"));
  }
}