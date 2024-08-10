import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextShadow extends StatelessWidget {
  TextShadow({
    super.key,
    required this.text,
    required this.color,
  });

  //                 Shadow
  final List<Shadow> vs = [
    const Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 3.0,
      color: Colors.black12,
    ),
    const Shadow(
      offset: Offset(3.0, 5.0),
      blurRadius: 8.0,
      color: Colors.black26,
    ),
  ];
  //               Text
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.w500,
        color: color,
        shadows: vs,
      ),
    );
  }
}
