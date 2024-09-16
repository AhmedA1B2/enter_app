import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:flutter/material.dart';

class ChooseItme extends StatelessWidget {
  const ChooseItme(
      {super.key, required this.x, this.onChanged, required this.text});
  final bool x;
  final void Function(bool?)? onChanged;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style: const TextStyle(
                  color: colorwhite, fontWeight: FontWeight.bold),
            ),
            Checkbox(
              value: x,
              checkColor: bgColor,
              fillColor: const WidgetStatePropertyAll(colorwhite),
              onChanged: onChanged,
            )
          ],
        ),
      ),
    );
  }
}
