import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_code/code/sarch_data.dart';
import 'package:enter_sirte_university_php/main.dart';
import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';

class InPoutChat extends StatefulWidget {
  const InPoutChat({super.key});

  @override
  State<InPoutChat> createState() => _InPoutChatState();
}

final TextEditingController message = TextEditingController();

bool isLoading = false;

class _InPoutChatState extends State<InPoutChat> {
  addMessag() async {
    if (sharedPref.getString("Changed") != null &&
        sharedPref.getString("Changed") != "") {
      isLoading = true;
      setState(() {});
      var response = await crud.postRequest(linkAddNoti, {
        "title": "من الكليه",
        "messag": message.text,
        "topic": sharedPref.getString("Changed").toString(),
        "college_add": sharedPref.getString("id"),
      });
      isLoading = false;
      setState(() {});
      if (response['status'] == "success") {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamedAndRemoveUntil("chat", (route) => false);
      } else {
        AwesomeDialog(
          // ignore: use_build_context_synchronously
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'تنبيه',
          desc: "هناك خطا",
        ).show();
      }
    }
  }

  addMessag1() async {
    if (sharedPref.getString("Changed1") != null &&
        sharedPref.getString("Changed1") != "") {
      isLoading = true;
      setState(() {});
      var response = await crud.postRequest(linkAddNoti, {
        "title": "من الكليه",
        "messag": message.text,
        "topic": sharedPref.getString("Changed1").toString(),
        "college_add": sharedPref.getString("id"),
      });
      isLoading = false;
      setState(() {});
      if (response['status'] == "success") {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamedAndRemoveUntil("chat", (route) => false);
      } else {
        AwesomeDialog(
          // ignore: use_build_context_synchronously
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'تنبيه',
          desc: "هناك خطا",
        ).show();
      }
    }
  }

  addMessag2() async {
    if (sharedPref.getString("Changed2") != null &&
        sharedPref.getString("Changed2") != "") {
      isLoading = true;
      setState(() {});
      var response = await crud.postRequest(linkAddNoti, {
        "title": "من الكليه",
        "messag": message.text,
        "topic": sharedPref.getString("Changed2").toString(),
        "college_add": sharedPref.getString("id"),
      });
      isLoading = false;
      setState(() {});
      if (response['status'] == "success") {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamedAndRemoveUntil("chat", (route) => false);
      } else {
        AwesomeDialog(
          // ignore: use_build_context_synchronously
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'تنبيه',
          desc: "هناك خطا",
        ).show();
      }
    }
  }

  addMessag3() async {
    if (sharedPref.getString("Changed3") != null &&
        sharedPref.getString("Changed3") != "") {
      isLoading = true;
      setState(() {});
      var response = await crud.postRequest(linkAddNoti, {
        "title": "من الكليه",
        "messag": message.text,
        "topic": sharedPref.getString("Changed3").toString(),
        "college_add": sharedPref.getString("id"),
      });
      isLoading = false;
      setState(() {});
      if (response['status'] == "success") {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamedAndRemoveUntil("chat", (route) => false);
      } else {
        AwesomeDialog(
          // ignore: use_build_context_synchronously
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'تنبيه',
          desc: "هناك خطا",
        ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: SizeConfig.screenWidth! * 0.05,
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                        onPressed: () {
                          if (message.text.isNotEmpty) {
                            if (sharedPref.getString("Changed") != null &&
                                    sharedPref.getString("Changed") != "" ||
                                sharedPref.getString("Changed1") != null &&
                                    sharedPref.getString("Changed1") != "" ||
                                sharedPref.getString("Changed2") != null &&
                                    sharedPref.getString("Changed2") != "" ||
                                sharedPref.getString("Changed3") != null &&
                                    sharedPref.getString("Changed3") != "") {
                              addMessag();
                              addMessag1();
                              addMessag2();
                              addMessag3();
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.rightSlide,
                                title: 'تنبيه',
                                desc:
                                    "عليك اختيار الفئه التي تريد ارسال الاشعار لها",
                              ).show();
                            }
                          } else {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              animType: AnimType.rightSlide,
                              title: 'تنبيه',
                              desc: 'لا يمكنك ترك الحقل فارغ',
                            ).show();
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_upward,
                          color: colorSplash,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.8,
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(color: colorwhite),
                      controller: message,
                      decoration: const InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          hintText: "الرساله",
                          hintStyle: TextStyle(color: colorwhite),
                          filled: true,
                          fillColor: bgColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: SizeConfig.screenWidth! * 0.05,
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: bgColor,
                        hoverColor: colorbody,
                        child: const Icon(
                          Icons.add,
                          color: colorwhite,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
  }
}
