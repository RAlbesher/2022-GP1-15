import 'package:circlight/Pages/ParentAddform.dart';
import 'package:circlight/Pages/StudentAddForm.dart';
import 'package:circlight/Pages/UpdateStudent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:circlight/Pages/UpdateParent.dart';
import 'package:circlight/Pages/Parent.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';

import 'Nav.dart';

class Studentdispaly extends StatefulWidget {
  const Studentdispaly({Key? key}) : super(key: key);

  @override
  State<Studentdispaly> createState() => _Studentdispaly();
}

class _Studentdispaly extends State<Studentdispaly> {
  @override
  List<String> docIDS = [];

  //get doc id

  Future getDocId() async {
    await FirebaseFirestore.instance.collection("Student").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            // print(document.reference);
            docIDS.add(document.reference.id);
          }),
        );
    //print(docIDS[0]);
  }

  @override
  Widget build(BuildContext context) {
    getDocId();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //for back

        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ParentAddform()));
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.grey,
        ),
        centerTitle: false,
        title: new Padding(
            padding: const EdgeInsets.only(left: 200),
            child: new Text("مرحبا",
                style: TextStyle(
                  color: Color(0xff0da6c2),
                ))),

        actions: [
          Container(
            //for profile image
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,

            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(30),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                  splashColor: Colors.black26,
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/Profile.png',
                    height: 50,
                    width: 50,
                    fit: BoxFit.contain,
                  )),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("Student").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  final snap = snapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snap.length,
                    itemBuilder: (context, index) {
                      //dynamic v = docIDS[index];

                      return Container(
                          height: 70,
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(2, 2),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Stack(alignment: Alignment.center, children: [
                            Container(
                              //for profile image
                              margin: const EdgeInsets.only(right: 10),
                              alignment: Alignment.centerRight,
                              child: Material(
                                elevation: 8,
                                borderRadius: BorderRadius.circular(30),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                    splashColor: Colors.black26,
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/images/Profile.png',
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.contain,
                                    )),
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 90),
                              alignment: Alignment.center,
                              child: Text(
                                snap[index]['Name'],
                                style: const TextStyle(
                                  color: Color(0xff0da6c2),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //container for button

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      // print(docIDS[index]);
                                      int Tab = 6;
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => Nav(
                                          documentId: docIDS[index],
                                          TabValue: 6,
                                        ),
                                      ));
                                    },
                                    //height: 80,
                                    child: Image.asset(
                                      'assets/images/edit.png',
                                      height: 60,
                                      width: 40,
                                      fit: BoxFit.contain,
                                    )),
                                InkWell(
                                    //height: 80,
                                    onTap: () {
                                      //////askkkk
                                      /* Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  //askkkkk faten where should it go ??;
*/
                                    },
                                    child: Image.asset(
                                      'assets/images/delete.png',
                                      height: 55,
                                      width: 40,
                                      fit: BoxFit.contain,
                                    )),
                              ],
                            ),
                          ]));
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

//this class is for search for now it is not liked to parent and studetn
class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = [
    "Parent",
    "student",
    "school",
    "teacher",
    "delegator",
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
