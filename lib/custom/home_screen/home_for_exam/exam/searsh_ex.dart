import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/api/crud.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_exam/widget/edit_form.dart';
import 'package:enter_sirte_university_php/main.dart';
import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';

class SearchEx extends StatefulWidget {
  const SearchEx({super.key});

  @override
  State<SearchEx> createState() => _SearchExState();
}

//

TextEditingController search = TextEditingController();
Crud crud = Crud();

searchData() async {
  var response = await crud.postRequest(linkSearchExam,
      {"search": search.text, "id": sharedPref.getString("id")});
  return response;
}

//

class _SearchExState extends State<SearchEx> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: bgColor,
                minWidth: SizeConfig.screenWidth! * 0.1,
                onPressed: () {
                  searchData();
                  setState(() {});
                },
                child: const Text(
                  'بحث',
                  style: TextStyle(
                    color: colorwhite,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: SizedBox(
                width: SizeConfig.screenWidth! * 0.8,
                child: TextFormField(
                  controller: search,
                  style: const TextStyle(color: colorwhite),
                  textAlign: TextAlign.end,
                  //########## vars #######//
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                  onSaved: (newValue) {},

                  decoration: InputDecoration(
                    //########focuse########//
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: bgColor,
                    )),
                    // ####### Hint ####### //
                    hintText: 'البحث بستخدام رقم القيد',
                    hintStyle: const TextStyle(
                      color: colorwhite,
                      fontWeight: FontWeight.bold,
                    ),
                    // ######## body ####### //
                    filled: true,
                    fillColor: bgColor,
                    focusColor: colorwhite,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: colorwhite,
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Table(
          children: [
            TableRow(children: [
              FutureBuilder(
                  future: searchData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data['status'] == 'fail') {
                        return const Center(
                            child: Text(
                          "لا يوجد بيانات",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                                      padding: const EdgeInsets.all(1.0),
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: colorSplash,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextButton(
                                            onPressed: () {
                                              search.text = '';
                                              // ignore: use_build_context_synchronously
                                              Navigator.of(context)
                                                  .pushReplacementNamed('qqqq');
                                            },
                                            child: const Text(
                                              'X',
                                              style: TextStyle(
                                                  color: Colors.black),
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
                                                    "id_ex": snapshot
                                                        .data['data'][i]
                                                            ['id_ex']
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
                                              style: TextStyle(
                                                  color: Colors.black),
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
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
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
                            child:
                                Text("خطأ في الأتصال أنقر لاعادة المحاوله")));
                  }),
            ])
          ],
        )
      ],
    );
  }
}
