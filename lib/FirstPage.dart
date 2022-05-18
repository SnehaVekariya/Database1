import 'package:database1/datbase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  TextEditingController org = TextEditingController();
  TextEditingController morphology = TextEditingController();
  TextEditingController media = TextEditingController();
  List<Map<String,dynamic>> list =[];
  DBHelper db = DBHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async{
                 list = await  db.retrive();
                },
                child: Text("ReadData"),
              ),

              Expanded(
                child: ListView.builder(itemCount: list.length,itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.all(5),
                    color: Colors.blue.shade100,
                    child: ListTile(
                      leading: Text("${list[index]["id"]}"),
                      title: Text("${list[index]["name"]}"),
                      subtitle: Text("${list[index]["mobile"]}"),
                    ),
                  );
                }),
              ),
            ],
          ),

          // child: Column(
          //   children: [
          //     TextField(
          //       controller: org,
          //       decoration: InputDecoration(
          //           label: Text("Organisms"), border: OutlineInputBorder()),
          //     ),
          //     TextField(
          //       controller: morphology,
          //       decoration: InputDecoration(
          //           label: Text("Morphology"), border: OutlineInputBorder()),
          //     ),
          //     TextField(
          //       controller: media,
          //       decoration: InputDecoration(
          //           label: Text("Selective Media"), border: OutlineInputBorder()),
          //     ),
          //     ElevatedButton(
          //       onPressed: () {
          //         DBHelper db = DBHelper();
          //         db.insertData("Harsh", "9955662233");
          //       },
          //       child: Text("CLICK"),
          //     ),
          //
          //     ElevatedButton(
          //       onPressed: () {
          //         DBHelper db = DBHelper();
          //         db.updateData("Harsh", "9955662233","5");
          //       },
          //       child: Text("Update Data"),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
