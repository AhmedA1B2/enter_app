import 'package:flutter/material.dart';

class LogoLogin extends StatelessWidget {
  const LogoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'image/home/Sirt.png',
      fit: BoxFit.contain,
    );
  }
}
