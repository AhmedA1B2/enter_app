import 'package:enter_sirte_university_php/custom/home_screen/home_for_data/data/sarch_data.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_data/widget/input_form.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_data/widget/outpot_tabel.dart';
import 'package:flutter/material.dart';

class EnterData extends StatefulWidget {
  const EnterData({super.key});

  @override
  State<EnterData> createState() => _EnterDataState();
}

class _EnterDataState extends State<EnterData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: const [
        InFo(),
        SearchData(),
        OutTable(),
      ],
    ));
  }
}
