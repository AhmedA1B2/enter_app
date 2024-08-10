import 'package:enter_sirte_university_php/License/custom/in_table.dart';
import 'package:enter_sirte_university_php/License/custom/title_table.dart';
import 'package:flutter/material.dart';

class License extends StatelessWidget {
  const License({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Text(
              "اتفاقية الترخيص",
              style: TextStyle(fontSize: 26),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              " الشروط وإخلاء المسؤولية:",
              style: TextStyle(fontSize: 16),
              textDirection: TextDirection.rtl,
            ), 
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "نحن لسنا مسؤولين عن أي استخدام غير قانوني لهذا المشروع لا نقدم أي ضمانات للمستخدم ولا ندعي ذلك ولسنا مسؤولين عن سوء الاستخدام خارج نطاق الجامعة أو داخلها هذا المشروع غير مكتمل ويمكن ان يكون به أخطاء وعلى المستخدم ان يعي ذلك قبل استخدامه يمنع منعا باتا استخدام حساب أي شخص آخر غير حسابك، على سبيل المثال لا الحصر  حساب طالب اخر او حساب موظف اخر ولا نتحمل عواقب من يخالف هذا الامر",
              style: TextStyle(fontSize: 14),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "إقرار بالمصادر",
              style: TextStyle(fontSize: 26),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              " الحزم المستخدمه:",
              style: TextStyle(fontSize: 16),
              textDirection: TextDirection.rtl,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "الحزم تجعل عملية تطوير البرمجيات أكثر كفاءة وفعالية من خلال توفير مكونات جاهزة للاستخدام وسهلة الدمج في المشاريع الحزم التي تم استخدامها في هذا المشروع:",
              style: TextStyle(fontSize: 14),
              textDirection: TextDirection.rtl,
            ),
          ),
          Table(
            border: TableBorder.all(color: Colors.black),
            children: const [
              TableRow(
                children: [
                  TitleTable(titleTable: "الحزمة"),
                  TitleTable(titleTable: "الشرح"),
                  TitleTable(titleTable: "الاصدار")
                ],
              ),
              TableRow(children: [
                InTable(
                  inTable: "cupertino_icons",
                ),
                InTable(
                  inTable: "توفر مجموعة من الأيقونات بأسلوب iOS",
                ),
                InTable(
                  inTable: "1.0.2",
                )
              ]),
              TableRow(children: [
                InTable(
                  inTable: "get",
                ),
                InTable(
                  inTable:
                      "حزمة لإدارة الحالة، التنقل، والتبعيات في تطبيقات فلاتر.",
                ),
                InTable(
                  inTable: "4.6.6",
                )
              ]),
              TableRow(children: [
                InTable(
                  inTable: "smooth_page_indicator",
                ),
                InTable(
                  inTable:
                      "تقدم مؤشرات صفحات متحركة وقابلة للتخصيص لعرض الصفحات",
                ),
                InTable(
                  inTable: "1.0.0",
                )
              ]),
              TableRow(children: [
                InTable(
                  inTable: "convex_bottom_bar",
                ),
                InTable(
                  inTable: "تقدم شريط تنقل سفلي بتصميم محدب.",
                ),
                InTable(
                  inTable: "3.2.0",
                )
              ]),
              TableRow(children: [
                InTable(
                  inTable: "flutter_map",
                ),
                InTable(
                  inTable: "حزمة لإضافة خرائط تفاعلية داخل التطبيقات.",
                ),
                InTable(
                  inTable: "6.1.0",
                )
              ]),
              TableRow(children: [
                InTable(
                  inTable: "latlong2",
                ),
                InTable(
                  inTable: "توفر وظائف للتعامل مع الإحداثيات الجغرافية.",
                ),
                InTable(
                  inTable: "0.9.1",
                )
              ]),
              TableRow(children: [
                InTable(
                  inTable: "webview_flutter",
                ),
                InTable(
                  inTable:
                      "تسمح بإضافة عنصر WebView داخل التطبيق لعرض صفحات الويب.",
                ),
                InTable(
                  inTable: "4.0.1",
                )
              ]),
              TableRow(children: [
                InTable(
                  inTable: "awesome_dialog",
                ),
                InTable(
                  inTable: "توفر ديالوجات (حوارات) جميلة ومتحركة.",
                ),
                InTable(
                  inTable: "3.2.0",
                )
              ]),
              TableRow(children: [
                InTable(
                  inTable: "shared_preferences",
                ),
                InTable(
                  inTable: " تستخدم لتخزين بيانات بسيطة بشكل دائم على الجهاز.",
                ),
                InTable(
                  inTable: "2.2.0",
                )
              ]),
              TableRow(children: [
                InTable(
                  inTable: "tutorial_coach_mark",
                ),
                InTable(
                  inTable: "تستخدم لإنشاء إرشادات تعليمية داخل التطبيق.",
                ),
                InTable(
                  inTable: "1.2.11",
                )
              ]),
              TableRow(children: [
                InTable(
                  inTable: "http",
                ),
                InTable(
                  inTable: "تستخدم لإجراء طلبات HTTP للتواصل مع الخوادم.",
                ),
                InTable(
                  inTable: "1.1.0",
                )
              ]),
              TableRow(children: [
                InTable(
                  inTable: "sqflite",
                ),
                InTable(
                  inTable: "توفر وظائف للتعامل مع قواعد بيانات SQLite.",
                ),
                InTable(
                  inTable: "2.0.2",
                )
              ]),
              TableRow(children: [
                InTable(
                  inTable: "dartz",
                ),
                InTable(
                  inTable:
                      " تستخدم للبرمجة الوظيفية والتعامل مع الأنواع الجبرية.",
                ),
                InTable(
                  inTable: "0.10.1",
                )
              ]),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "ملاحظه: كل الحزم المستخدمه من موقع pub.dev",
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }
}
