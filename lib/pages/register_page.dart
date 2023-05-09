import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mesafer/models/ticket_firebase.dart';
import 'package:mesafer/models/user_data_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../layout/mesafer_layout.dart';
import '../shared/components/components.dart';
import 'signin_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var firstNameController = TextEditingController();
  var lastnameController = TextEditingController();
  var emailController = TextEditingController();
  var createpassordController = TextEditingController();
  var confirmpassordController = TextEditingController();
  TicketFirebase ticketFirebase = TicketFirebase();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
 // String? docId = UserDataModel.userId;

 /* void filluserdata(){
      UserDataModel.firstName=firstNameController.text;
      UserDataModel.lastName=lastnameController.text;
      UserDataModel.email=emailController.text;
      UserDataModel.password=createpassordController.text;
      
  }*/
   // create Cllection Function
  Future<void> _createUserCollection(String uid) async {
   // filluserdata();
    
    
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
       'first_name' :firstNameController.text,
       'last_name':lastnameController.text,
       'emai':emailController.text,
       'password':createpassordController.text,
       'dateOfBirth':'',
       'gender':'',
       'nationalId':'',
       'phoneNumber':'',
       'id':uid,
    });
    UserDataModel.userId = uid;
  }
  
  Future<void> _signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: createpassordController.text,
      );
      
      if (userCredential.user != null) {
        await _createUserCollection(userCredential.user!.uid);
        // Navigate to the home screen
         Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => mesafer_layout(),
            ),
            (route) => false);
      }
    } on FirebaseAuthException catch (ex) {
      // Handle sign-up errors
      if (ex.code == 'weak-password') {
        showSnackBar(context, 'weak password');
      } else if (ex.code == 'email-already-in-use') {
        showSnackBar(context, 'email already exists');
      }
    } catch (e) {
      // Handle other errors
       showSnackBar(context, 'there was an error');
    }
  }

  

  

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.05,),
                Center(
                  child: Text(
                    'Sign UP',
                    style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 350,
                      width: 400,
                      color: Colors.white.withOpacity(0.8),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 170,
                                      child: defaultFormField(
                                        controller: firstNameController,
                                        type: TextInputType.name,
                                        onSubmitte: (String value) {
                                    
                                          print(value);
                                        },
                                        label: Text(
                                          'First name',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    SizedBox(
                                      width: 170,
                                      child: defaultFormField(
                                        controller: lastnameController,
                                        type: TextInputType.name,
                                        onSubmitte: ( value) {
                                        
                                          print(value);
                                        },
                                     
                                        label: Text(
                                          'Last name',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFormField(
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                onSubmitte: (String value) {
                               
                                  print(value);
                                },
                               
                                label: Text(
                                  'User ID / E-mail',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20.0),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFormField(
                                controller: createpassordController,
                                type: TextInputType.visiblePassword,
                                onSubmitte: (String value) {
                              
                                  print(value);
                                },
                              
                                label: Text(
                                  'Create Passord',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20.0),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFormField(
                                controller: confirmpassordController,
                                type: TextInputType.visiblePassword,
                                onSubmitte: (String value) {
                                  print(value);
                                },
                                
                                label: Text(
                                  'Confirm Passord',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 70,
                      width: 400,
                      color: Color.fromARGB(255, 223, 152, 59).withOpacity(0.6),
                      child: MaterialButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});

                          await _signUp();
                          //await ticketFirebase.initializeTripsDatabase();

                            isLoading = false;
                            setState(() {});
                          } else {}
                        },
                        child: Text(
                          'Sign UP',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account ?',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 0.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
