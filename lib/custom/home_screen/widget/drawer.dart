import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.textdrawer});
  final String textdrawer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth! * 1,
      height: SizeConfig.screenHeight! * 0.08,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textdrawer,
              style: const TextStyle(
                color: bgColor,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
