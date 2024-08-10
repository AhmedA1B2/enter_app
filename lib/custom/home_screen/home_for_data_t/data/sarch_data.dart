import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/api/crud.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_data_t/widget/edit_form.dart';
import 'package:enter_sirte_university_php/main.dart';
import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';

class SearchData extends StatefulWidget {
  const SearchData({super.key});

  @override
  State<SearchData> createState() => _SearchDataState();
}

TextEditingController search = TextEditingController();
Crud crud = Crud();

searchData() async {
  var response = await crud.postRequest(linkSearchTeacher,
      {"search": search.text, "id": sharedPref.getString("id")});
  return response;
}

class _SearchDataState extends State<SearchData> {
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
                    hintText: 'بحث بستخدام البريد أو الأسم',
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
            TableRow(
              children: [
                FutureBuilder(
                    future: searchData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data['status'] == 'fail') {
                          return const Center(
                              child: Text(
                            "هنا تظهر نتائج البحث",
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
                                                    .pushReplacementNamed(
                                                        'homeTe');
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
                                                  dialogType:
                                                      DialogType.warning,
                                                  animType: AnimType.scale,
                                                  title: 'حذف',
                                                  desc: "هل تريد حذف الطالب؟",
                                                  btnOkOnPress: () async {
                                                    var response = await crud
                                                        .postRequest(
                                                            linkDeleteStudent, {
                                                      "id_te": snapshot
                                                          .data['data'][i]
                                                              ['id_te']
                                                          .toString()
                                                    });
                                                    if (response['status'] ==
                                                        "success") {
                                                      // ignore: use_build_context_synchronously
                                                      Navigator.of(context)
                                                          .pushReplacementNamed(
                                                              'homeTe');
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
                                                            builder:
                                                                (context) =>
                                                                    EdFo(
                                                                      stData: snapshot
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
                                              "${snapshot.data['data'][i]['college']}")),
                                      Center(
                                          child: Text(
                                              "${snapshot.data['data'][i]['pass']}")),
                                      Center(
                                          child: Text(
                                              "${snapshot.data['data'][i]['emil']}")),
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
                              child:
                                  Text("خطأ في الأتصال أنقر لاعادة المحاوله")));
                    }),
              ],
            ),
          ],
        )
      ],
    );
  }
}
