import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/api/crud.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/main.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_data/custom/custom_input.dart';
import 'package:enter_sirte_university_php/vars/color.dart';

class InFo extends StatefulWidget {
  const InFo({super.key});

  @override
  State<InFo> createState() => _InFoState();
}

class _InFoState extends State<InFo> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  //
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController num = TextEditingController();
  TextEditingController tkss = TextEditingController();
  //

  Crud crud = Crud();

  bool isLoading = false;
  up() {
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed('home');
  }

  String time = "1";

  addSt() async {
    if (name.text != "" &&
        pass.text != "" &&
        num.text != "" &&
        tkss.text != "") {
      isLoading = true;
      setState(() {});
      var responseTime = await crud
          .postRequest(linkFrequencyStudent, {"search_value": num.text});
      if (responseTime == '' || responseTime == 0) {
        time = "1";
      } else {
        time = responseTime['data'][0]['frequency'].toString();
      }

      var response = await crud.postRequest(linkAddStudent, {
        "name": name.text,
        "pass": pass.text,
        "num": num.text,
        "college": sharedPref.getString("college"),
        "tkss": tkss.text,
        "time": time,
        "who_added": sharedPref.getString("id")
      });
      isLoading = false;
      setState(() {});
      up();
      if (response['status'] == "success") {
        Navigator.of(context).pushReplacementNamed('home');
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'info',
          desc: 'خطأ في الاتصال',
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
                    'أدخل بيانات الطالب',
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
                        hintText: 'كلمة المرور',
                        mycontroller: pass,
                      ),
                      CustomInput(
                        hintText: 'رقم القيد',
                        inputType: TextInputType.number,
                        mycontroller: num,
                      ),
                      CustomInput(
                        hintText: 'الاسم',
                        mycontroller: name,
                      ),
                      CustomInput(
                        hintText: 'القسم',
                        mycontroller: tkss,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    addSt();
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
                          'ادخال الطالب',
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
