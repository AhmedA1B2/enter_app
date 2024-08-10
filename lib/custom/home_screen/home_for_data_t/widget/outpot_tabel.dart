import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/api/crud.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_data_t/custom/custom_lable_table.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_data_t/widget/edit_form.dart';
import 'package:enter_sirte_university_php/main.dart';
import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:flutter/material.dart';

getStudent() async {
  var response = await crud
      .postRequest(linkViewStudent, {"id": sharedPref.getString("id")});

  return response;
}

class OutTable extends StatefulWidget {
  const OutTable({super.key});

  @override
  State<OutTable> createState() => _OutTableState();
}

Crud crud = Crud();

class _OutTableState extends State<OutTable> {
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
                  dataa: 'حذف',
                ),
                TextTable(
                  dataa: 'تعديل',
                ),
                TextTable(
                  dataa: 'المعدل العام',
                ),
                TextTable(
                  dataa: 'التقدير',
                ),
                TextTable(
                  dataa: 'الفصل الدراسي',
                ),
                TextTable(
                  dataa: 'القسم',
                ),
                TextTable(
                  dataa: 'الكلية',
                ),
                TextTable(
                  dataa: 'رقم القيد',
                ),
                TextTable(
                  dataa: 'كلمة المرور',
                ),
                TextTable(
                  dataa: 'الأسم',
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
                                                    linkDeleteStudent, {
                                              "id_st": snapshot.data['data'][i]
                                                      ['id_st']
                                                  .toString()
                                            });
                                            if (response['status'] ==
                                                "success") {
                                              // ignore: use_build_context_synchronously
                                              Navigator.of(context)
                                                  .pushReplacementNamed('home');
                                            }
                                          },
                                          btnOkColor: redColor,
                                        ).show();
                                      },
                                      child: const Text(
                                        'حذف',
                                        style: TextStyle(color: Colors.black),
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
                                          dialogType: DialogType.infoReverse,
                                          animType: AnimType.rightSlide,
                                          title: 'تعديل',
                                          desc: "هل تريد تعديل بيانات الطالب؟",
                                          btnOkOnPress: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                    builder: (context) => EdFo(
                                                          stData: snapshot
                                                              .data['data'][i],
                                                        )));
                                          },
                                          btnOkColor: bgColor,
                                        ).show();
                                      },
                                      child: const Text(
                                        'تعديل',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['mo']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['tq']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['time']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['tkss']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['college']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['num']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['pass']}")),
                              Center(
                                  child: Text(
                                      "${snapshot.data['data'][i]['name']}")),
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


//IT@gmail.com
//nsy483oo32