import 'package:enter_sirte_university_php/custom/home_screen/home_for_data_t/widget/input_form.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_data_t/widget/outpot_tabel.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_data_t/data/sarch_data.dart';
import 'package:flutter/material.dart';

class EnterDataTe extends StatefulWidget {
  const EnterDataTe({super.key});

  @override
  State<EnterDataTe> createState() => _EnterDataTeState();
}

class _EnterDataTeState extends State<EnterDataTe> {
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
