import 'package:enter_sirte_university_php/custom/home_screen/home_for_code/code/sarch_data.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_code/widget/input_form.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_code/widget/outpot_tabel.dart';
import 'package:flutter/material.dart';

class EnterCode extends StatefulWidget {
  const EnterCode({super.key});

  @override
  State<EnterCode> createState() => _EnterDataState();
}

class _EnterDataState extends State<EnterCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: const [
        InFoCode(),
        SearchCode(),
        OutTableCode(),
      ],
    ));
  }
}
