import 'package:circlight/ParentAddform.dart';
import 'package:circlight/StudentAddForm.dart';
import 'package:circlight/UpdateStudent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:circlight/UpdateParent.dart';
import 'package:circlight/Parent.dart';

class DisplayStudent extends StatefulWidget {
  const DisplayStudent({Key? key}) : super(key: key);

  @override
  State<DisplayStudent> createState() => _DisplayStudent();
}

class _DisplayStudent extends State<DisplayStudent> {
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
        backgroundColor: Colors.white54,
        title: Center(child: Text(" مرحبا مدرسه العلوم")),
        actions: [
          Center(
            child: IconButton(
              onPressed: () {
                // method to show the search bar
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search),
            ),
          )
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
                      dynamic v = docIDS[index];
                      // print("object");
                      // print(v);
                      //  print(snap[index]['Name']);
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
                        child: Stack(
                          children: [
                            Container(
                              //for profile image
                              margin: const EdgeInsets.only(left: 30),
                              alignment: Alignment.centerRight,
                              child: Material(
                                elevation: 8,
                                borderRadius: BorderRadius.circular(30),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  splashColor: Colors.black26,
                                  onTap: () {},
                                  child: Ink.image(
                                    image: NetworkImage(
                                        'assets/images/profileicon.png'),
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            //var v = docIDS[index] ;

                            Container(
                              margin: const EdgeInsets.only(left: 50),
                              alignment: Alignment.center,
                              child: Text(
                                snap[index]['Name'],
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(right: 20),
                                alignment: Alignment.centerRight,
                                child: Row(children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 14, vertical: 8),
                                          textStyle: TextStyle(fontSize: 10)),
                                      child: Text("add student"),
                                      onPressed: () {
                                        // print(docIDS[index]);
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => UpdateStudent(
                                            documentId: docIDS[index],
                                          ),
                                        ));
                                      })
                                ])),

                            /*child: RaisedButton(onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ParentAddform();),
                                })*/
                            // ),
                          ],
                        ),
                      );
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
