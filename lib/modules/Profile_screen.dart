import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mesafer/shared/components/components.dart';
import '../models/user_data_model.dart';

class profile_screen extends StatefulWidget {
  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  var _firstNameController = TextEditingController();
  var _lastNameController = TextEditingController();

  var _birthDateController = TextEditingController();

  var _nationalIdController = TextEditingController();

  var _phoneNumberController = TextEditingController();

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _genderController = TextEditingController();
  bool enable = false;
  List users = [];

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
        body: users.isEmpty || users == null
            ? Center(
                child: Text('Loading...'),
              )
            : SingleChildScrollView(
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
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'First Name *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      defaultFormField2(
                        enable: enable,
                        controller: enable == true
                            ? _firstNameController
                            : TextEditingController(
                                text: users[0]['first_name']),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Last Name *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      defaultFormField2(
                        enable: enable,
                        controller: enable == true
                            ? _lastNameController
                            : TextEditingController(
                                text: users[0]['last_name']),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Date of Birth *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      defaultFormField2(
                        type: TextInputType.datetime,
                        enable: enable,
                        controller: enable == true
                            ? _birthDateController
                            : TextEditingController(
                                text: users[0]['dateOfBirth']),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Gender *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      defaultFormField2(
                        enable: false,
                        controller: enable == true
                            ? _genderController
                            : TextEditingController(text: users[0]['gender']),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'National Id *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      defaultFormField2(
                        type: TextInputType.number,
                        enable: enable,
                        controller: enable == true
                            ? _nationalIdController
                            : TextEditingController(
                                text: users[0]['nationalId']),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Phone Number *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      defaultFormField2(
                        type: TextInputType.number,
                        enable: enable,
                        controller: enable == true
                            ? _phoneNumberController
                            : TextEditingController(
                                text: users[0]['phoneNumber']),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'E-Mail *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      defaultFormField2(
                          type: TextInputType.emailAddress,
                          enable: enable,
                          controller: enable == true
                              ? _emailController
                              : TextEditingController(text: users[0]['emai'])),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Password *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      defaultFormField2(
                        type: TextInputType.visiblePassword,
                        enable: enable,
                        controller: enable == true
                            ? _passwordController
                            : TextEditingController(text: users[0]['password']),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            if (enable == true) {
                              await updateData();
                            } else {}
                            setState(() {
                              enable = !enable;
                            });
                            await getData();
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
                                enable == false ? 'UPDATE INFO' : 'SAVE INFO',
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

  updateData() async {
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection('users');

    await usersRef.doc(UserDataModel.userId).update({
      'first_name': _firstNameController.text,
      'last_name': _lastNameController.text,
      'emai': _emailController.text,
      'dateOfBirth': _birthDateController.text,
      'password': _passwordController.text,
      'nationalId': _nationalIdController.text,
      'phoneNumber': _phoneNumberController.text,
      'gender': _genderController.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data updated successfully.'),
      ),
    );
  }

  getData() async {
    DocumentReference userRef = FirebaseFirestore.instance
        .collection('users')
        .doc(UserDataModel.userId);
    DocumentSnapshot snapshot = await userRef.get();

    if (snapshot.exists) {
      Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;

      setState(() {
        users.clear();
        users.add(userData);
        updateTextFields2();
      });
    }
  }

  updateTextFields2() {
    setState(() {
      _firstNameController.text = users[0]['first_name'];
      _lastNameController.text = users[0]['last_name'];
      _emailController.text = users[0]['emai'];
      _birthDateController.text = users[0]['dateOfBirth'];
      _passwordController.text = users[0]['password'];
      _nationalIdController.text = users[0]['nationalId'];
      _phoneNumberController.text = users[0]['phoneNumber'];
      _genderController.text = users[0]['gender'];
    });
  }
}
