import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConShadow extends StatelessWidget {
  ConShadow({
    super.key,
    required this.con,
  });

  //                 Shadow
  final List<BoxShadow> vbs = [
    const BoxShadow(
      color: Colors.black26,
      spreadRadius: 5,
      blurRadius: 20,
      offset: Offset(0, 0),
    ),
  ];
  //               con
  final Widget con;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: vbs,
        borderRadius: BorderRadius.circular(8),
      ),
      child: con,
    );
  }
}
