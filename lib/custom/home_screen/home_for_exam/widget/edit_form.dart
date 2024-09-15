import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/api/crud.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_exam/custom/custom_input.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';
import 'package:enter_sirte_university_php/vars/color.dart';

class EdFoQ extends StatefulWidget {
  final exData;
  const EdFoQ({
    super.key,
    this.exData,
  });

  @override
  State<EdFoQ> createState() => _InFoState();
}

class _InFoState extends State<EdFoQ> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  //

  TextEditingController pass = TextEditingController();
  TextEditingController num = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController m1 = TextEditingController();
  TextEditingController d1 = TextEditingController();
  TextEditingController m2 = TextEditingController();
  TextEditingController d2 = TextEditingController();
  TextEditingController m3 = TextEditingController();
  TextEditingController d3 = TextEditingController();
  TextEditingController m4 = TextEditingController();
  TextEditingController d4 = TextEditingController();
  TextEditingController m5 = TextEditingController();
  TextEditingController d5 = TextEditingController();
  TextEditingController m6 = TextEditingController();
  TextEditingController d6 = TextEditingController();
  TextEditingController m7 = TextEditingController();
  TextEditingController d7 = TextEditingController();
  TextEditingController m8 = TextEditingController();
  TextEditingController d8 = TextEditingController();
  TextEditingController m9 = TextEditingController();
  TextEditingController d9 = TextEditingController();
  TextEditingController m10 = TextEditingController();
  TextEditingController d10 = TextEditingController();
  TextEditingController m11 = TextEditingController();
  TextEditingController d11 = TextEditingController();
  TextEditingController m12 = TextEditingController();
  TextEditingController d12 = TextEditingController();
  TextEditingController nm = TextEditingController();
  //

  TextEditingController dn1 = TextEditingController();
  TextEditingController dn2 = TextEditingController();
  TextEditingController dn3 = TextEditingController();
  TextEditingController dn4 = TextEditingController();
  TextEditingController dn5 = TextEditingController();
  TextEditingController dn6 = TextEditingController();
  TextEditingController dn7 = TextEditingController();
  TextEditingController dn8 = TextEditingController();
  TextEditingController dn9 = TextEditingController();
  TextEditingController dn10 = TextEditingController();
  TextEditingController dn11 = TextEditingController();
  TextEditingController dn12 = TextEditingController();

  //

  List<Widget> inmaoad = [];

  Crud crud = Crud();

  bool isLoading = false;

  editEx() async {
    if (pass.text != "" && num.text != "") {
      isLoading = true;
      setState(() {});
      var response = await crud.postRequest(linkEidtExam, {
        "idnum": num.text,
        "pass": pass.text,
        "time": time.text,
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
        //
        "dn1": dn1.text,
        "dn2": dn2.text,
        "dn3": dn3.text,
        "dn4": dn4.text,
        "dn5": dn5.text,
        "dn6": dn6.text,
        "dn7": dn7.text,
        "dn8": dn8.text,
        "dn9": dn9.text,
        "dn10": dn10.text,
        "dn11": dn11.text,
        "dn12": dn12.text,
        "in_finl": "1",
        "id_ex": widget.exData['id_ex'].toString()
      });
      isLoading = false;
      setState(() {});

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
  void initState() {
    pass.text = widget.exData["pass"].toString();
    num.text = widget.exData["idnum"].toString();
    m1.text = widget.exData["m1"].toString();
    d1.text = widget.exData["d1"].toString();
    m2.text = widget.exData["m2"].toString();
    d2.text = widget.exData["d2"].toString();
    m3.text = widget.exData["m3"].toString();
    d3.text = widget.exData["d3"].toString();
    m4.text = widget.exData["m4"].toString();
    d4.text = widget.exData["d4"].toString();
    m5.text = widget.exData["m5"].toString();
    d5.text = widget.exData["d5"].toString();
    m6.text = widget.exData["m6"].toString();
    d6.text = widget.exData["d6"].toString();
    m7.text = widget.exData["m7"].toString();
    d7.text = widget.exData["d7"].toString();
    m8.text = widget.exData["m8"].toString();
    d8.text = widget.exData["d8"].toString();
    m9.text = widget.exData["m9"].toString();
    d9.text = widget.exData["d9"].toString();
    m10.text = widget.exData["m10"].toString();
    d10.text = widget.exData["d10"].toString();
    m11.text = widget.exData["m11"].toString();
    d11.text = widget.exData["d11"].toString();
    m12.text = widget.exData["m12"].toString();
    d12.text = widget.exData["d12"].toString();
    //
    // dn1.text = widget.exData["dn1"].toString();
    // dn2.text = widget.exData["dn2"].toString();
    // dn3.text = widget.exData["dn3"].toString();
    // dn4.text = widget.exData["dn4"].toString();
    // dn5.text = widget.exData["dn5"].toString();
    // dn6.text = widget.exData["dn6"].toString();
    // dn7.text = widget.exData["dn7"].toString();
    // dn8.text = widget.exData["dn8"].toString();
    // dn9.text = widget.exData["dn9"].toString();
    // dn10.text = widget.exData["dn10"].toString();
    // dn11.text = widget.exData["dn11"].toString();
    // dn12.text = widget.exData["dn12"].toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(children: [
              Container(
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
                        'أدخل دراجات الطالب',
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
                            mycontroller: num,
                          ),
                          CustomInputQ(
                            hintText: "الفصل/السنه الدراسيه",
                            mycontroller: time,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: inmaoad,
                          ),
                          Center(
                            child: FloatingActionButton(
                              onPressed: () {
                                showFinl1() {
                                  if (widget.exData["in_finl"].toString() ==
                                      "0") {
                                    return CustomInputQ(
                                        hintText: 'درجة الامتحان النهائي',
                                        mycontroller: dn1);
                                  } else {
                                    return const SizedBox();
                                  }
                                }

                                showFinl2() {
                                  if (widget.exData["in_finl"].toString() ==
                                      "0") {
                                    return CustomInputQ(
                                        hintText: 'درجة الامتحان النهائي',
                                        mycontroller: dn2);
                                  } else {
                                    return const SizedBox();
                                  }
                                }

                                showFinl3() {
                                  if (widget.exData["in_finl"].toString() ==
                                      "0") {
                                    return CustomInputQ(
                                        hintText: 'درجة الامتحان النهائي',
                                        mycontroller: dn3);
                                  } else {
                                    return const SizedBox();
                                  }
                                }

                                showFinl4() {
                                  if (widget.exData["in_finl"].toString() ==
                                      "0") {
                                    return CustomInputQ(
                                        hintText: 'درجة الامتحان النهائي',
                                        mycontroller: dn4);
                                  } else {
                                    return const SizedBox();
                                  }
                                }

                                showFinl5() {
                                  if (widget.exData["in_finl"].toString() ==
                                      "0") {
                                    return CustomInputQ(
                                        hintText: 'درجة الامتحان النهائي',
                                        mycontroller: dn5);
                                  } else {
                                    return const SizedBox();
                                  }
                                }

                                showFinl6() {
                                  if (widget.exData["in_finl"].toString() ==
                                      "0") {
                                    return CustomInputQ(
                                        hintText: 'درجة الامتحان النهائي',
                                        mycontroller: dn6);
                                  } else {
                                    return const SizedBox();
                                  }
                                }

                                showFinl7() {
                                  if (widget.exData["in_finl"].toString() ==
                                      "0") {
                                    return CustomInputQ(
                                        hintText: 'درجة الامتحان النهائي',
                                        mycontroller: dn7);
                                  } else {
                                    return const SizedBox();
                                  }
                                }

                                showFinl8() {
                                  if (widget.exData["in_finl"].toString() ==
                                      "0") {
                                    return CustomInputQ(
                                        hintText: 'درجة الامتحان النهائي',
                                        mycontroller: dn8);
                                  } else {
                                    return const SizedBox();
                                  }
                                }

                                showFinl9() {
                                  if (widget.exData["in_finl"].toString() ==
                                      "0") {
                                    return CustomInputQ(
                                        hintText: 'درجة الامتحان النهائي',
                                        mycontroller: dn9);
                                  } else {
                                    return const SizedBox();
                                  }
                                }

                                showFinl10() {
                                  if (widget.exData["in_finl"].toString() ==
                                      "0") {
                                    return CustomInputQ(
                                        hintText: 'درجة الامتحان النهائي',
                                        mycontroller: dn10);
                                  } else {
                                    return const SizedBox();
                                  }
                                }

                                showFinl11() {
                                  if (widget.exData["in_finl"].toString() ==
                                      "0") {
                                    return CustomInputQ(
                                        hintText: 'درجة الامتحان النهائي',
                                        mycontroller: dn11);
                                  } else {
                                    return const SizedBox();
                                  }
                                }

                                showFinl12() {
                                  if (widget.exData["in_finl"].toString() ==
                                      "0") {
                                    return CustomInputQ(
                                        hintText: 'درجة الامتحان النهائي',
                                        mycontroller: dn12);
                                  } else {
                                    return const SizedBox();
                                  }
                                }

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
                                            showFinl1(),
                                            const Spacer()
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
                                            showFinl2(),
                                            const Spacer()
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
                                            showFinl3(),
                                            const Spacer()
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
                                            showFinl4(),
                                            const Spacer()
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
                                            showFinl5(),
                                            const Spacer()
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
                                            showFinl6(),
                                            const Spacer()
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
                                            showFinl7(),
                                            const Spacer()
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
                                            showFinl8(),
                                            const Spacer()
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
                                            showFinl9(),
                                            const Spacer()
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
                                            showFinl10(),
                                            const Spacer()
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
                                            showFinl11(),
                                            const Spacer()
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
                                            showFinl12(),
                                            const Spacer()
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
                        editEx();
                        Navigator.of(context).pushReplacementNamed('qqqq');
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
              ),
            ]),
    );
  }
}
