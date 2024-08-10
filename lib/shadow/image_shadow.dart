import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImgShadow extends StatelessWidget {
  ImgShadow({
    super.key,
    required this.img,
  });

  //                 Shadow
  final List<BoxShadow> vbs = [
    const BoxShadow(
      color: Colors.black,
      spreadRadius: -60,
      blurRadius: 30,
      offset: Offset(10, 10),
    ),
  ];
  //               img
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: vbs,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Image.asset(
        img,fit: BoxFit.contain,
      ),
    );
  }
}
