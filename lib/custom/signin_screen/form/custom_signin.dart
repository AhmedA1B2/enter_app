import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/api/crud.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/api/valid.dart';
import 'package:enter_sirte_university_php/custom/widget/get_to_login_form.dart';
import 'package:enter_sirte_university_php/custom/widget/logo.dart';
import 'package:enter_sirte_university_php/custom/widget/txet_form_field.dart';
import 'package:enter_sirte_university_php/shadow/container_shadow.dart';
import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final String textB = '';

  Crud crud = Crud();

  bool isLoading = false;

  TextEditingController college = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  signUp() async {
    if (college.text == "" || email.text == "" || password.text == "") {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: 'لا يمكنك ترك حقل فارغ',
      ).show();
      setState(() {});
    } else {
      isLoading = true;
      setState(() {});
      var response = await crud.postRequest(linkSignup, {
        "college": college.text,
        "email": email.text,
        "pass": password.text
      });
      isLoading = false;
      setState(() {});
      if (response['status'] == "success") {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamedAndRemoveUntil("logn", (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: colorwhite,
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                SizedBox(
                    height: SizeConfig.screenHeight! * 0.3,
                    width: SizeConfig.screenWidth! * 0.5,
                    child: const LogoLogin()),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 200, vertical: 20),
                  child: ConShadow(
                    con: Container(
                      height: SizeConfig.defaultSize! * 40,
                      width: SizeConfig.defaultSize! * 35,
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 50),
                            child: Text(
                              'انشاء حساب',
                              style: TextStyle(color: colorwhite, fontSize: 42),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 20),
                            child: CustomTextFormField(
                              // ignore: body_might_complete_normally_nullable
                              validator: (val) {
                                validInput(val!);
                              },
                              hintText: 'أسم الكلية',
                              inputType: TextInputType.visiblePassword,
                              mycontroller: college,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 20),
                            child: CustomTextFormField(
                              // ignore: body_might_complete_normally_nullable
                              validator: (val) {
                                validInput(val!);
                              },
                              hintText: 'بريد الكلة الالكتروني',
                              inputType: TextInputType.visiblePassword,
                              mycontroller: email,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 20),
                            child: CustomTextFormField(
                              // ignore: body_might_complete_normally_nullable
                              validator: (val) {
                                validInput(val!);
                              },
                              hintText: 'كلمة المرور',
                              inputType: TextInputType.visiblePassword,
                              mycontroller: password,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: MaterialButton(
                              onPressed: () async {
                                await signUp();
                              },
                              child: Container(
                                height: SizeConfig.defaultSize! * 4,
                                width: SizeConfig.defaultSize! * 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  color: colorwhite,
                                ),
                                child: const Center(
                                  child: Text(
                                    'انشاء',
                                    style: TextStyle(
                                      color: bgColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 36,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const GetToLoginForm(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
