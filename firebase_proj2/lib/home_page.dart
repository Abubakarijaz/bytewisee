import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'get_user_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIds = [];

  // doc IDS
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (documents) {
              print(documents.reference);
              docIds.add(documents.reference.id);
            },
          ),
        );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(user.email!)),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [

              MaterialButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                color: Colors.green[200],
                child: Text('Sign Out'),
              ),
              Expanded(
                child: FutureBuilder(
                  future: getDocId(),
                  builder: (context,snapshot){
                    return ListView.builder(
                      itemCount: docIds.length,

                        itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: GetUserName(documentID: docIds[index],),
                            tileColor: Colors.grey[300],

                          ),
                        );
                        }
                    );
                  },
                )
              )

            ],
          ),
        ),
      ),
    );
  }
}
