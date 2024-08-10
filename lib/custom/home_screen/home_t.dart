import 'package:enter_sirte_university_php/custom/home_screen/go_to/chat.dart';
import 'package:enter_sirte_university_php/custom/home_screen/go_to/code.dart';
import 'package:enter_sirte_university_php/custom/home_screen/go_to/home.dart';
import 'package:enter_sirte_university_php/custom/home_screen/go_to/qqqq.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_data_t/data/enter_data.dart';
import 'package:enter_sirte_university_php/main.dart';
import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:flutter/material.dart';

class HomeTe extends StatefulWidget {
  const HomeTe({super.key});

  @override
  State<HomeTe> createState() => _HomeTeState();
}

class _HomeTeState extends State<HomeTe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: colorwhite),
        backgroundColor: bgColor,
        toolbarHeight: 60,
        leading: Image.asset('image/home/Sirt.png'),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Sirte University',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: colorwhite,
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        width: 700,
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const GoToHome(),
            const GoToQqqq(),
            const GoToCode(),
            const GoToChat(),
            SizedBox(
              height: 500,
              child: Column(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      sharedPref.clear();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacementNamed('logn');
                    },
                    child: const Text('تسجيل الخروج'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const EnterDataTe(),
    );
  }
}
