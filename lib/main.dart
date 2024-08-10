import 'package:enter_sirte_university_php/custom/home_screen/chat.dart';
import 'package:enter_sirte_university_php/custom/home_screen/code.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_t.dart';
import 'package:enter_sirte_university_php/custom/home_screen/qqqq.dart';
import 'package:enter_sirte_university_php/custom/login_screen/form/custom_login.dart';
import 'package:enter_sirte_university_php/custom/signin_screen/form/custom_signin.dart';
import 'package:enter_sirte_university_php/custom/splash_screen/custom_splash_screen.dart';
import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetMaterialApp(
      color: colorwhite,
      home: const Welcome(),
      routes: {
        "home": (context) => const Home(),
        "homeTe": (context) => const HomeTe(),
        "code": (context) => const Code(),
        "qqqq": (context) => const Qqqq(),
        "chat": (context) => const Chat(),
        "sign": (context) => const SigninForm(),
        "logn": (context) => const LoginForm(),
      },
    );
  }
}
