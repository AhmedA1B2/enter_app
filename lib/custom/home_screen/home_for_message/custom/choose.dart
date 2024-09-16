import 'package:enter_sirte_university_php/custom/home_screen/home_for_message/custom/widget/choose_itme.dart';
import 'package:enter_sirte_university_php/custom/widget/txet_form_field.dart';
import 'package:enter_sirte_university_php/main.dart';
import 'package:flutter/material.dart';

class Choose extends StatefulWidget {
  const Choose({super.key});

  @override
  State<Choose> createState() => _ChooseState();
}

bool x = false;
bool x1 = false;
bool x2 = false;
bool x3 = false;

int y = 0;
int y1 = 0;
int y2 = 0;
int y3 = 0;

TextEditingController mycontroller = TextEditingController();
TextEditingController mycontroller1 = TextEditingController();

onChanged() {
  if (y == 1) {
    sharedPref.setString("Changed", mycontroller.text);
  } else if (y == 0) {
    sharedPref.setString("Changed", "");
  }
  if (y1 == 1) {
    sharedPref.setString("Changed1", mycontroller1.text);
  } else if (y1 == 0) {
    sharedPref.setString("Changed1", "");
  }
  if (y2 == 1) {
    sharedPref.setString("Changed2", "student");
  } else if (y2 == 0) {
    sharedPref.setString("Changed2", "");
  }
  if (y3 == 1) {
    sharedPref.setString("Changed3", "teacher");
  } else if (y3 == 0) {
    sharedPref.setString("Changed3", "");
  }
}

show() {
  if (y == 1) {
    return CustomTextFormField(
      hintText: "ادخل رقم قيد الطالب",
      mycontroller: mycontroller,
    );
  } else {
    return const SizedBox();
  }
}

show2() {
  if (y1 == 1) {
    return CustomTextFormField(
      hintText: "ادخل البريد الالكتروني للمدرس",
      mycontroller: mycontroller1,
    );
  } else {
    return const SizedBox();
  }
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ChooseItme(
              x: x,
              onChanged: (p0) {
                if (y == 0) {
                  x = true;
                  y = 1;
                } else {
                  x = false;
                  y = 0;
                }
                onChanged();
                setState(() {});
              },
              text: 'طالب واحد',
            ),
            ChooseItme(
              x: x1,
              onChanged: (p0) {
                if (y1 == 0) {
                  x1 = true;
                  y1 = 1;
                } else {
                  x1 = false;
                  y1 = 0;
                }
                onChanged();
                setState(() {});
              },
              text: 'مدرس واحد',
            ),
            ChooseItme(
              x: x2,
              onChanged: (p0) {
                if (y2 == 0) {
                  x2 = true;
                  y2 = 1;
                } else {
                  x2 = false;
                  y2 = 0;
                }
                onChanged();
                setState(() {});
              },
              text: 'كل الطلبه',
            ),
            ChooseItme(
              x: x3,
              onChanged: (p0) {
                if (y3 == 0) {
                  x3 = true;
                  y3 = 1;
                } else {
                  x3 = false;
                  y3 = 0;
                }
                onChanged();
                setState(() {});
              },
              text: 'كل المدرسين',
            ),
          ],
        ),
        show(),
        show2()
      ],
    );
  }
}
