import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:flutter/material.dart';

class GetToSigninForm extends StatelessWidget {
  const GetToSigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('sign');
          },
          child: const Text(
            'انشاء حساب',
            style: TextStyle(color: colorwhite),
          )),
    );
  }
}
