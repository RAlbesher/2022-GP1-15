import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class EditParent extends StatefulWidget {
  @override
  _ParentAddForm createState() => _ParentAddForm();
}

class _ParentAddForm extends State<EditParent> {
  // documents IDs
  List<String> docIDs = [];
//get the documents IDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection("Parent").get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              //the name snapshot is a variable that yoy can change
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
    //.get get the documents
  }

  @override
  void initState() {
    // TODO: implement initState
    getDocId();
    super.initState();
  }

  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.04),
                  Text(
                    "                           تحديث حساب ولي الامر ",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 20, color: Color(0xFF363F93)),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    //to take text from user input
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(hintText: "اسم المستخدم "),
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Please Enter a the empty fields ";
                      else {
                        return value;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    //to take text from user input
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(hintText: "رقم الجوال"),
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Please Enter a the empty fields ";
                      else {
                        return value;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    //to take text from user input
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(hintText: "البريد الالكتروني "),
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Please Enter a the empty fields ";
                      else {
                        return value;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    //to take text from user input
                    textAlign: TextAlign.right,
                    decoration:
                        InputDecoration(hintText: "رقم الهوية /الإقامة"),
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Please Enter a the empty fields ";
                      else {
                        return value;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    //to take text from user input
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(hintText: "رقم الهوية/الإقامة"),
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Please Enter a the empty fields ";
                      else {
                        return value;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    //to take text from user input
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(hintText: "الجنسية"),
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Please Enter a the empty fields ";
                      else {
                        return value;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    //to take text from user input
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(hintText: "الوظيفية"),
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Please Enter a the empty fields ";
                      else {
                        return value;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    //to take text from user input
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: "رقم جوال  ",
                    ),
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Please Enter a the empty fields ";
                      else {
                        return value;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    //to take text from user input
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: "رقم جوال آخر ",
                    ),
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Please Enter a the empty fields ";
                      else {
                        return value;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),

                  /*  OutlinedButton(
                      child: Text("إضافه"),
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              255, 54, 187, 244))))))*/
                  Container(
                    child: Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          child: Text("          حفظ        "),
                          onPressed: () => print("it's pressed"),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 15, 216, 8),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
