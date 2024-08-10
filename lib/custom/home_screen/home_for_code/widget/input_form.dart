import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/api/crud.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/main.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_data/custom/custom_input.dart';
import 'package:enter_sirte_university_php/vars/color.dart';

class InFoCode extends StatefulWidget {
  const InFoCode({super.key});

  @override
  State<InFoCode> createState() => _InFoCodeState();
}

class _InFoCodeState extends State<InFoCode> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  //
  TextEditingController name = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController num = TextEditingController();
  //

  Crud crud = Crud();

  bool isLoading = false;
  up() {
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed('code');
  }

  addSt() async {
    if (name.text != "" && code.text != "" && num.text != "") {
      isLoading = true;
      setState(() {});
      var response = await crud.postRequest(linkAddCode, {
        "name": name.text,
        "code": code.text,
        "num": num.text,
        "who_added": sharedPref.getString("id")
      });
      isLoading = false;
      setState(() {});
      up();
      if (response['status' == "success"]) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
        ).show();
        setState(() {});
      }
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'info',
        desc: 'لا يمكنك ترك حقل فارغ',
      ).show();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            decoration: const BoxDecoration(
              color: colorwhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 5,
                  blurRadius: 20,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'ادخل الماده',
                    style: TextStyle(
                      color: bgColor,
                      fontSize: 32,
                    ),
                  ),
                ),
                Form(
                  key: formState,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      CustomInput(
                        hintText: 'الرمز',
                        mycontroller: code,
                      ),
                      CustomInput(
                        hintText: 'عدد الوحدات',
                        inputType: TextInputType.number,
                        mycontroller: num,
                      ),
                      CustomInput(
                        hintText: 'الاسم',
                        mycontroller: name,
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    addSt();
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      height: SizeConfig.defaultSize! * 3,
                      width: SizeConfig.defaultSize! * 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.black, width: 2),
                        color: colorbody,
                      ),
                      child: const Center(
                        child: Text(
                          'ادخال',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
