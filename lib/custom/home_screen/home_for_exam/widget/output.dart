import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/api/crud.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_data/custom/custom_lable_table.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_exam/widget/edit_form.dart';
import 'package:enter_sirte_university_php/main.dart';
import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:flutter/material.dart';

getStudent() async {
  var response =
      await crud.postRequest(linkViewExam, {"id": sharedPref.getString("id")});

  return response;
}

class OutTableE extends StatefulWidget {
  const OutTableE({super.key});

  @override
  State<OutTableE> createState() => _OutTableState();
}

Crud crud = Crud();

class _OutTableState extends State<OutTableE> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: colorwhite,
          child: const Padding(padding: EdgeInsets.all(8.0), child: MyWidget()),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          children: const [
            TableRow(
              children: [
                TextTable(
                  dataa: 'المزيد',
                ),
                TextTable(
                  dataa: 'الفصل الدراسي',
                ),
                TextTable(
                  dataa: 'المادة',
                ),
                TextTable(
                  dataa: 'الدرجة',
                ),
                TextTable(
                  dataa: 'المادة',
                ),
                TextTable(
                  dataa: 'الدرجة',
                ),
                TextTable(
                  dataa: 'المادة',
                ),
                TextTable(
                  dataa: 'الدرجة',
                ),
                TextTable(
                  dataa: 'المادة',
                ),
                TextTable(
                  dataa: 'الدرجة',
                ),
                TextTable(
                  dataa: 'المادة',
                ),
                TextTable(
                  dataa: 'الدرجة',
                ),
                TextTable(
                  dataa: 'المادة',
                ),
                TextTable(
                  dataa: 'الدرجة',
                ),
                TextTable(
                  dataa: 'المادة',
                ),
                TextTable(
                  dataa: 'الدرجة',
                ),
                TextTable(
                  dataa: 'المادة',
                ),
                TextTable(
                  dataa: 'الدرجة',
                ),
                TextTable(
                  dataa: 'المادة',
                ),
                TextTable(
                  dataa: 'الدرجة',
                ),
                TextTable(
                  dataa: 'المادة',
                ),
                TextTable(
                  dataa: 'الدرجة',
                ),
                TextTable(
                  dataa: 'المادة',
                ),
                TextTable(
                  dataa: 'الدرجة',
                ),
                TextTable(
                  dataa: 'المادة',
                ),
                TextTable(
                  dataa: 'الدرجة',
                ),
                TextTable(
                  dataa: 'كلمة المرور',
                ),
                TextTable(
                  dataa: 'رقم القيد',
                ),
              ],
            ),
          ],
        ),
        FutureBuilder(
            future: getStudent(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data['status'] == 'fail') {
                  return const Center(
                      child: Text(
                    "لا يوجد بيانات",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ));
                }

                return ListView.builder(
                    itemCount: snapshot.data['data'].length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return Table(
                        border: TableBorder.all(color: Colors.black),
                        children: [
                          TableRow(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: redColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: TextButton(
                                          onPressed: () {
                                            AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.warning,
                                              animType: AnimType.scale,
                                              title: 'حذف',
                                              desc: "هل تريد حذف الطالب؟",
                                              btnOkOnPress: () async {
                                                var response = await crud
                                                    .postRequest(
                                                        linkDeleteExam, {
                                                  "id_ex": snapshot.data['data']
                                                          [i]['id_ex']
                                                      .toString()
                                                });
                                                if (response['status'] ==
                                                    "success") {
                                                  // ignore: use_build_context_synchronously
                                                  Navigator.of(context)
                                                      .pushReplacementNamed(
                                                          'qqqq');
                                                }
                                              },
                                              btnOkColor: redColor,
                                            ).show();
                                          },
                                          child: const Text(
                                            'حذف',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: colorbody,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: TextButton(
                                          onPressed: () {
                                            AwesomeDialog(
                                              context: context,
                                              dialogType:
                                                  DialogType.infoReverse,
                                              animType: AnimType.rightSlide,
                                              title: 'تعديل',
                                              desc:
                                                  "هل تريد تعديل بيانات الطالب؟",
                                              btnOkOnPress: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EdFoQ(
                                                              exData: snapshot
                                                                      .data[
                                                                  'data'][i],
                                                            )));
                                              },
                                              btnOkColor: bgColor,
                                            ).show();
                                          },
                                          child: const Text(
                                            'تعديل',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['time']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['m12']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['d12']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['m11']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['d11']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['m10']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['d10']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['m9']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['d9']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['m8']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['d8']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['m7']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['d7']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['m6']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['d6']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['m5']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['d5']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['m4']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['d4']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['m3']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['d3']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['m2']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['d2']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['m1']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['d1']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['pass']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['idnum']}")),
                            ],
                          ),
                        ],
                      );
                    });
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: Text("Loading ..."));
              }
              return MaterialButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Center(
                      child: Text("خطأ في الأتصال أنقر لاعادة المحاوله")));
            }),
      ],
    );
  }
}
