import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:enter_sirte_university_php/custom/home_screen/home_for_code/code/sarch_data.dart';
import 'package:enter_sirte_university_php/main.dart';
import 'package:enter_sirte_university_php/vars/color.dart';
import 'package:enter_sirte_university_php/vars/size.dart';
import 'package:flutter/material.dart';

getStudent() async {
  var response = await crud
      .postRequest(linkViewNoti, {"college_add": sharedPref.getString("id")});

  return response;
}

class OutputChat extends StatefulWidget {
  const OutputChat({super.key});

  @override
  State<OutputChat> createState() => _OutputChatState();
}

class _OutputChatState extends State<OutputChat> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                itemBuilder: (context, i) {
                  String topic = "";
                  if (snapshot.data['data'][i]['topic'] == "teacher") {
                    topic = "المدرسين";
                  }
                  if (snapshot.data['data'][i]['topic'] == "student") {
                    topic = "الطلاب";
                  }
                  if (snapshot.data['data'][i]['topic'] != "student" &&
                      snapshot.data['data'][i]['topic'] != "teacher") {
                    topic = snapshot.data['data'][i]['topic'];
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: SizeConfig.screenWidth! * 0.7,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                          topLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80),
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 2),
                              blurRadius: 10,
                              blurStyle: BlurStyle.inner)
                        ],
                        color: colorSplash,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "${snapshot.data['data'][i]['messag']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, height: 1.5),
                                ),
                                Text("الفئه المستهدفه : $topic")
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.warning,
                                    animType: AnimType.scale,
                                    title: 'حذف',
                                    desc: "هل تريد حذف الرساله؟",
                                    btnOkOnPress: () async {
                                      var response = await crud.postRequest(
                                          linkDeleteNoti, {
                                        "id": snapshot.data['data'][i]['id']
                                            .toString()
                                      });
                                      if (response['status'] == "success") {
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context)
                                            .pushReplacementNamed('chat');
                                      }
                                    },
                                    btnOkColor: redColor,
                                  ).show();
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
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
        });
  }
}
