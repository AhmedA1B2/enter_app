import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/api/crud.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_data/custom/custom_input.dart';
import 'package:enter_sirte_university_php/vars/color.dart';

class EdFoCode extends StatefulWidget {
  final code;
  const EdFoCode({
    super.key,
    this.code,
  });

  @override
  State<EdFoCode> createState() => _EdFoCodeState();
}

class _EdFoCodeState extends State<EdFoCode> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  //
  TextEditingController name = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController num = TextEditingController();
  //
  Crud crud = Crud();

  bool isLoading = false;

  editSt() async {
    if (name.text != "" && code.text != "" && num.text != "") {
      isLoading = true;
      setState(() {});
      var response = await crud.postRequest(linkEidtCode, {
        "name": name.text,
        "code": code.text,
        "num": num.text,
        "id": widget.code['id'].toString()
      });
      isLoading = false;
      setState(() {});

      if (response['status'] == "success") {
        Navigator.of(context).pushReplacementNamed('code');
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
    name.text = widget.code["name"];
    code.text = widget.code["code"];
    num.text = widget.code["num"].toString();
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
