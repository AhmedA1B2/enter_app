import 'package:enter_sirte_university_php/main.dart';
import 'package:enter_sirte_university_php/shadow/text_shadow.dart';
import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    fadingAnimation =
        Tween<double>(begin: 0.2, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);
    if (sharedPref.getString("id") == null) {
      ogToOnLogn();
    }
    if (sharedPref.getString("id") != null) {
      ogToOnHome();
    }
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          const SizedBox(height: 80),
          Center(
            child: SizedBox(
                width: 500,
                child: Image.asset(
                  'image/home/Sirt.png',
                  fit: BoxFit.contain,
                )),
          ),
          const SizedBox(height: 20),
          FadeTransition(
            opacity: fadingAnimation!,
            child: TextShadow(
              text: "Welcome",
              color: colorSplash,
            ),
          ),
        ],
      ),
    );
  }

  void ogToOnLogn() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('logn');
    });
  }

  void ogToOnHome() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed("home");
    });
  }
}
