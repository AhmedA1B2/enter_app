import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConShadow2 extends StatelessWidget {
  ConShadow2({
    super.key,
    required this.con,
  });

  //                 Shadow
  final List<BoxShadow> vbs = [
    const BoxShadow(
      color: Colors.black26,
      spreadRadius: 0.1,
      blurRadius: 20,
      offset: Offset(1, 5),
    ),
  ];
  //               con
  final Widget con;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: vbs,
        borderRadius: BorderRadius.circular(100),
      ),
      child: con,
    );
  }
}
