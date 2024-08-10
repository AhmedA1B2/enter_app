import 'package:enter_sirte_university_php/custom/home_screen/home_for_exam/exam/searsh_ex.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_exam/widget/input_form.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_exam/widget/output.dart';
import 'package:flutter/material.dart';

class ExQq extends StatefulWidget {
  const ExQq({super.key});

  @override
  State<ExQq> createState() => _ExQqState();
}

class _ExQqState extends State<ExQq> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        InQF(),
        SearchEx(),
        OutTableE(),
      ],
    );
  }
}
