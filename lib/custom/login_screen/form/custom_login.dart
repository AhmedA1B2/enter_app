import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/License/license.dart';
import 'package:enter_sirte_university_php/api/crud.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/custom/widget/get_to_signin_form.dart';
import 'package:enter_sirte_university_php/custom/widget/logo.dart';
import 'package:enter_sirte_university_php/custom/widget/txet_form_field.dart';
import 'package:enter_sirte_university_php/main.dart';
import 'package:enter_sirte_university_php/shadow/container_shadow.dart';
import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Crud crud = Crud();

  bool isLoading = false;

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  login() async {
    if (email.text == "" || password.text == "") {
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
      var response = await crud
          .postRequest(linkLogin, {"email": email.text, "pass": password.text});
      isLoading = false;
      setState(() {});
      if (response['status'] == "success") {
        sharedPref.setString("id", response['data']['id'].toString());
        sharedPref.setString("college", response['data']['college'].toString());
        sharedPref.setString("email", response['data']['email'].toString());
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      } else {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Error',
          desc: "هناك خطأ في إدخال البيانات",
        ).show();

        setState(() {});
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
                      width: SizeConfig.defaultSize! * 35,
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Form(
                        key: formState,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 50),
                              child: Text(
                                'تسجيل الدخول',
                                style:
                                    TextStyle(color: colorwhite, fontSize: 42),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 20),
                              child: CustomTextFormField(
                                hintText: 'البريد الالكتروني',
                                inputType: TextInputType.visiblePassword,
                                mycontroller: email,
                                // ignore: body_might_complete_normally_nullable
                                validator: (val) {
                                  if (val == '') {
                                    return 'لا يمكن ترك الحقل فارغ';
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 20),
                              child: CustomTextFormField(
                                hintText: 'كلمة المرور',
                                inputType: TextInputType.visiblePassword,
                                mycontroller: password,
                                // ignore: body_might_complete_normally_nullable
                                validator: (val) {
                                  if (val == '') {
                                    return 'لا يمكن ترك الحقل فارغ';
                                  }
                                },
                              ),
                            ),
                            TextButton(
                              onPressed: () async {},
                              child: const Text(
                                'هل تريد تغيير كلمة المرور؟',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: MaterialButton(
                                onPressed: () async {
                                  await login();
                                },
                                child: Container(
                                  height: SizeConfig.defaultSize! * 4,
                                  width: SizeConfig.defaultSize! * 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    color: colorwhite,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'الدخول',
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
                            const GetToSigninForm(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const License(),
                          ));
                    },
                    child: const Text(
                      "اتفاقية الترخيص",
                      style: TextStyle(color: bgColor),
                    )),
              ],
            ),
    );
  }
}
