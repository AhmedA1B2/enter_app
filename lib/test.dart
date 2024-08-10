import 'package:enter_sirte_university_php/api/crud.dart';
import 'package:enter_sirte_university_php/api/links.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

getTime() async {
  var responseTime =
      await crud.postRequest(linkFrequencyStudent, {"search_value": "1234"});

  return responseTime;
}

Crud crud = Crud();

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getTime(),
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
                    return Center(
                        child:
                            Text("${snapshot.data['data'][i]['frequency']}"));
                  });
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text("if --> Loading ..."));
            }
            return const Center(child: Text("else --> Loading ..."));
          }),
    );
  }
}
