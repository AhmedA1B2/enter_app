import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_code/code/sarch_data.dart';
import 'package:enter_sirte_university_php/main.dart';
import 'package:flutter/material.dart';

class GoToEndSemester extends StatelessWidget {
  const GoToEndSemester({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.scale,
          title: 'انهاء',
          desc: "هل انت متاكد من انك تريد انهاء الفصل الدراسي",
          btnOkOnPress: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.bottomSlide,
              title: 'تحذير',
              desc:
                  "اذا ضغطت على موافق فانك توافق على انهاء الفصل الدراسي ولا يمكن التراجع عن هذه الخطوه",
              btnOkOnPress: () async {
                await crud.postRequest(linkNexamDelete,
                    {"college_add": sharedPref.getString("id")});
                await crud.postRequest(linkEndSemester, {});

                Navigator.of(context).pushReplacementNamed('qqqq');
              },
              btnOkColor: Colors.amberAccent,
              btnCancelOnPress: () {},
            ).show();
          },
          btnCancelOnPress: () {},
        ).show();
      },
      child: const Text(
        "انتهاء الفصل الدراسي",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
