import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/api/crud.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_exam/custom/custom_input.dart';
import 'package:enter_sirte_university_php/main.dart';
import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';

class InQF extends StatefulWidget {
  const InQF({super.key});

  @override
  State<InQF> createState() => _InQFState();
}

class _InQFState extends State<InQF> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController pass = TextEditingController();
  final TextEditingController num = TextEditingController();
  final TextEditingController m1 = TextEditingController();
  final TextEditingController d1 = TextEditingController();
  final TextEditingController m2 = TextEditingController();
  final TextEditingController d2 = TextEditingController();
  final TextEditingController m3 = TextEditingController();
  final TextEditingController d3 = TextEditingController();
  final TextEditingController m4 = TextEditingController();
  final TextEditingController d4 = TextEditingController();
  final TextEditingController m5 = TextEditingController();
  final TextEditingController d5 = TextEditingController();
  final TextEditingController m6 = TextEditingController();
  final TextEditingController d6 = TextEditingController();
  final TextEditingController m7 = TextEditingController();
  final TextEditingController d7 = TextEditingController();
  final TextEditingController m8 = TextEditingController();
  final TextEditingController d8 = TextEditingController();
  final TextEditingController m9 = TextEditingController();
  final TextEditingController d9 = TextEditingController();
  final TextEditingController m10 = TextEditingController();
  final TextEditingController d10 = TextEditingController();
  final TextEditingController m11 = TextEditingController();
  final TextEditingController d11 = TextEditingController();
  final TextEditingController m12 = TextEditingController();
  final TextEditingController d12 = TextEditingController();
  final TextEditingController nm = TextEditingController();
  List<Widget> inmaoad = [];

  bool isLoading = false;
  Crud crud = Crud();

  up() {
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed('qqqq');
  }

  addEx() async {
    if (pass.text != "") {
      isLoading = true;
      setState(() {});
      var responseTime = await crud
          .postRequest(linkFrequencyStudent, {"search_value": num.text});
      var response = await crud.postRequest(linkAddExam, {
        "idnum": num.text,
        "pass": pass.text,
        "m1": m1.text,
        "d1": d1.text,
        "m2": m2.text,
        "d2": d2.text,
        "m3": m3.text,
        "d3": d3.text,
        "m4": m4.text,
        "d4": d4.text,
        "m5": m5.text,
        "d5": d5.text,
        "m6": m6.text,
        "d6": d6.text,
        "m7": m7.text,
        "d7": d7.text,
        "m8": m8.text,
        "d8": d8.text,
        "m9": m9.text,
        "d9": d9.text,
        "m10": m10.text,
        "d10": d10.text,
        "m11": m11.text,
        "d11": d11.text,
        "m12": m12.text,
        "d12": d12.text,
        "time": responseTime['data'][0]['frequency'].toString(),
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
            width: SizeConfig.screenWidth! * 1,
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
                    'أدخل درجات الطالب',
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
                      CustomInputQ(
                        hintText: 'عدد المواد',
                        mycontroller: nm,
                      ),
                      CustomInputQ(
                        hintText: 'كلمة المرور',
                        mycontroller: pass,
                      ),
                      CustomInputQ(
                        hintText: 'رقم القيد',
                        inputType: TextInputType.number,
                        mycontroller: num,
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: inmaoad,
                      ),
                      Center(
                        child: FloatingActionButton(
                          onPressed: () {
                            inmaoad = [];
                            setState(() {
                              int subjectsCount = int.parse(nm.text);
                              for (var i = -1; i < subjectsCount + 1; i++) {
                                if (i == 1) {
                                  inmaoad.add(
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const Spacer(),
                                        CustomInputQ(
                                          hintText: 'رمز المادة',
                                          mycontroller: m1,
                                        ),
                                        CustomInputQ(
                                          hintText: 'الدرجة',
                                          mycontroller: d1,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  );
                                }
                                if (i == 2) {
                                  inmaoad.add(
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const Spacer(),
                                        CustomInputQ(
                                          hintText: 'رمز المادة',
                                          mycontroller: m2,
                                        ),
                                        CustomInputQ(
                                          hintText: 'الدرجة',
                                          mycontroller: d2,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  );
                                }
                                if (i == 3) {
                                  inmaoad.add(
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const Spacer(),
                                        CustomInputQ(
                                          hintText: 'رمز المادة',
                                          mycontroller: m3,
                                        ),
                                        CustomInputQ(
                                          hintText: 'الدرجة',
                                          mycontroller: d3,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  );
                                }
                                if (i == 4) {
                                  inmaoad.add(
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const Spacer(),
                                        CustomInputQ(
                                          hintText: 'رمز المادة',
                                          mycontroller: m4,
                                        ),
                                        CustomInputQ(
                                          hintText: 'الدرجة',
                                          mycontroller: d4,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  );
                                }
                                if (i == 5) {
                                  inmaoad.add(
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const Spacer(),
                                        CustomInputQ(
                                          hintText: 'رمز المادة',
                                          mycontroller: m5,
                                        ),
                                        CustomInputQ(
                                          hintText: 'الدرجة',
                                          mycontroller: d5,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  );
                                }
                                if (i == 6) {
                                  inmaoad.add(
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const Spacer(),
                                        CustomInputQ(
                                          hintText: 'رمز المادة',
                                          mycontroller: m6,
                                        ),
                                        CustomInputQ(
                                          hintText: 'الدرجة',
                                          mycontroller: d6,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  );
                                }
                                if (i == 7) {
                                  inmaoad.add(
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const Spacer(),
                                        CustomInputQ(
                                          hintText: 'رمز المادة',
                                          mycontroller: m7,
                                        ),
                                        CustomInputQ(
                                          hintText: 'الدرجة',
                                          mycontroller: d7,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  );
                                }
                                if (i == 8) {
                                  inmaoad.add(
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const Spacer(),
                                        CustomInputQ(
                                          hintText: 'رمز المادة',
                                          mycontroller: m8,
                                        ),
                                        CustomInputQ(
                                          hintText: 'الدرجة',
                                          mycontroller: d8,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  );
                                }
                                if (i == 9) {
                                  inmaoad.add(
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const Spacer(),
                                        CustomInputQ(
                                          hintText: 'رمز المادة',
                                          mycontroller: m9,
                                        ),
                                        CustomInputQ(
                                          hintText: 'الدرجة',
                                          mycontroller: d9,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  );
                                }
                                if (i == 10) {
                                  inmaoad.add(
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const Spacer(),
                                        CustomInputQ(
                                          hintText: 'رمز المادة',
                                          mycontroller: m10,
                                        ),
                                        CustomInputQ(
                                          hintText: 'الدرجة',
                                          mycontroller: d10,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  );
                                }
                                if (i == 11) {
                                  inmaoad.add(
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const Spacer(),
                                        CustomInputQ(
                                          hintText: 'رمز المادة',
                                          mycontroller: m11,
                                        ),
                                        CustomInputQ(
                                          hintText: 'الدرجة',
                                          mycontroller: d11,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  );
                                }
                                if (i == 12) {
                                  inmaoad.add(
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const Spacer(),
                                        CustomInputQ(
                                          hintText: 'رمز المادة',
                                          mycontroller: m12,
                                        ),
                                        CustomInputQ(
                                          hintText: 'الدرجة',
                                          mycontroller: d12,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  );
                                }
                              }
                            });
                          },
                          backgroundColor: bgColor,
                          child: const Icon(Icons.add,
                              color: colorwhite, size: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    addEx();
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
                          'ادخال البيانات',
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
