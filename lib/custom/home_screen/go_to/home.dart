import 'package:enter_sirte_university_php/custom/home_screen/home.dart';
import 'package:enter_sirte_university_php/custom/home_screen/widget/drawer.dart';
import 'package:flutter/material.dart';

class GoToHome extends StatelessWidget {
  const GoToHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Home()));
                },
                child: const CustomDrawer(textdrawer: 'ادخال بيانات الطلاب'));
  }
}