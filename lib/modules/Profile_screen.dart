import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mesafer/shared/components/components.dart';

import '../models/user_data_model.dart';
import 'notifications_screen.dart';

class profile_screen extends StatefulWidget {
  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  List users = [];
  getData() async {
    DocumentReference usersRef = FirebaseFirestore.instance.collection('users').doc('U0snplzSc2NMiN5bhDgorBglElk2');
    var responseBody = await usersRef.get();

    setState(() {
      users.add(responseBody.data());
    });
  }
  

  /* --------------------------
  Future<String> getDocumentId(String collectionName) async {
  try {
    final CollectionReference collection = FirebaseFirestore.instance.collection(collectionName);
    final QuerySnapshot querySnapshot = await collection.get();

    if (querySnapshot.docs.isNotEmpty) {
      final DocumentSnapshot docSnapshot = querySnapshot.docs.first;
      final String documentId = docSnapshot.id;
      return documentId;
    } else {
      // return a default value if no documents are found
      return "default_document_id";
    }
  } catch (e) {
    // handle the exception and return a default value
    print("Error retrieving document ID: $e");
    return "default_document_id";
  }
}
*/

  /*
  Future<void> fetchUserDataFromFirestore(String userId) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentReference userRef = firestore.collection('users').doc(userId);
  DocumentSnapshot snapshot = await userRef.get();
  if (snapshot.exists) {
    print(snapshot.data());
  } else {
    print('Document does not exist');
  }
}*/
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mesafer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications_active,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            )
          ],
        ),
        body:users.isEmpty || users==null?Center(child: Text('Loading...'),):SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal Information',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'First Name *',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                defaultFormField2(
                  enable: false,
                  controller:
                      TextEditingController(text: users[0]['first_name']),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Last Name *',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                defaultFormField2(
                  enable: false,
                  controller:
                      TextEditingController(text: users[0]['last_name']),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Date of Birth *',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                defaultFormField2(
                  enable: false,
                  controller:
                      TextEditingController(text: users[0]['dateOfBirth']),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Gender *',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                defaultFormField2(
                  enable: false,
                  controller: TextEditingController(text: users[0]['gender']),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'National Id *',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                defaultFormField2(
                  enable: false,
                  controller:
                      TextEditingController(text: users[0]['nationalId']),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Phone Number *',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                defaultFormField2(
                  enable: false,
                  controller:
                      TextEditingController(text: users[0]['phoneNumber']),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'E-Mail *',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                defaultFormField2(
                  enable: false,
                    controller: TextEditingController(text: users[0]['emai'])),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Password *',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                defaultFormField2(
                  enable: false,
                  controller: TextEditingController(text: users[0]['password']),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Pay Function
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 242, 168, 81),
                      ),
                      child: Center(
                        child: Text(
                          'UPDATE INFO',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
