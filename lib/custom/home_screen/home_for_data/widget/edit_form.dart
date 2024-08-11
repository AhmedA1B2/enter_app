import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/api/crud.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_data/custom/custom_input.dart';
import 'package:enter_sirte_university_php/vars/color.dart';

class EdFo extends StatefulWidget {
  final stData;
  const EdFo({
    super.key,
    this.stData,
  });

  @override
  State<EdFo> createState() => _InFoState();
}

class _InFoState extends State<EdFo> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  //
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController num = TextEditingController();
  TextEditingController colege = TextEditingController();
  TextEditingController tkss = TextEditingController();
  //
  Crud crud = Crud();

  bool isLoading = false;

  editSt() async {
    if (name.text != "" &&
        pass.text != "" &&
        num.text != "" &&
        colege.text != "" &&
        tkss.text != "") {
      isLoading = true;
      setState(() {});
      var responseTime = await crud
          .postRequest(linkFrequencyStudent, {"search_value": num.text});

      var response = await crud.postRequest(linkEidtStudent, {
        "name": name.text,
        "pass": pass.text,
        "num": num.text,
        "college": colege.text,
        "tkss": tkss.text,
        "time": responseTime['data'][0]['frequency'].toString(),
        "id_st": widget.stData['id_st'].toString()
      });
      isLoading = false;
      setState(() {});

      if (response['status'] == "success") {
        Navigator.of(context).pushReplacementNamed('home');
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: '!!!',
          desc: 'لم يتم التعديل',
        ).show();
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
    name.text = widget.stData["name"];
    pass.text = widget.stData["pass"];
    num.text = widget.stData["num"];
    colege.text = widget.stData["college"];
    tkss.text = widget.stData["tkss"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        iconTheme: const IconThemeData(color: colorwhite),
      ),
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
                            mycontroller: num,
                          ),
                          CustomInput(
                            hintText: 'الاسم',
                            mycontroller: name,
                          ),
                          CustomInput(
                            hintText: 'التخصص',
                            mycontroller: tkss,
                          ),
                          CustomInput(
                            hintText: 'الكلية',
                            mycontroller: colege,
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        editSt();
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
                              'تعديل',
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
