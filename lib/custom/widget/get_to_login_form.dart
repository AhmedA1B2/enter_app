import 'package:enter_sirte_university_php/custom/login_screen/form/custom_login.dart';
import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetToLoginForm extends StatelessWidget {
  const GetToLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () {
                            Get.to(
                              () => const LoginForm(),
                              transition: Transition.cupertinoDialog,
                            );
                          },
                          child: const Text(
                            'تسجيل الدخول',
                            style: TextStyle(color: colorwhite),
                          )),
                    );
  }
}