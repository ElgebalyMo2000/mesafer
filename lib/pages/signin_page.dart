import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mesafer/models/user_data_model.dart';
import 'package:mesafer/pages/register_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../layout/mesafer_layout.dart';

import '../shared/components/components.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var emailController = TextEditingController();
  var passordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? email;
  String? password;
  bool? keepLoged= false; 
  SharedPreferences? sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/1.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: 250,
                        width: 400,
                        color: Colors.white.withOpacity(0.8),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                defaultFormField(
                                  type: TextInputType.emailAddress,
                                  controller: emailController,
                                  onSubmitte: (String value) {
                                    print(value);
                                  },
                                  onchange: (String value) {
                                    email = value;
                                    print(value);
                                  },
                                  label: Text(
                                    'User ID / E-mail',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                defaultFormField(
                                  type: TextInputType.visiblePassword,
                                  controller: passordController,
                                  obscureTexty: true,
                                  onSubmitte: (String value) {
                                    print(value);
                                  },
                                  onchange: (String value) {
                                    password = value;
                                    print(value);
                                  },
                                  label: Text(
                                    'password',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    CheckBoxWidet(),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      'keep me loged ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
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
                        height: 70,
                        width: 400,
                        color:
                            Color.fromARGB(255, 223, 152, 59).withOpacity(0.6),
                        child: MaterialButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              try {
                                await loginUser();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => mesafer_layout(),
                                    ),
                                    (route) => false);
                              } on FirebaseAuthException catch (ex) {
                                if (ex.code == 'user-not-found') {
                                  showSnackBar(context, 'user not found');
                                } else if (ex.code == 'wrong-password') {
                                  showSnackBar(context, 'wrong password');
                                }
                              } catch (ex) {
                                print(ex);
                                showSnackBar(context, 'there was an error');
                              }

                              isLoading = false;
                              setState(() {});
                            } else {}
                          },
                          child: Text(
                            'SIGN IN',
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
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password ?',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
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
                        'Dont have account ?',
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
                            MaterialPageRoute(
                                builder: (context) => SignupPage()),
                          );
                        },
                        child: Text(
                          'Sign_up',
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
      ),
    );
    //  ),
    //   );
  }
  Future<void> saveLoginState(bool isLoggedIn) async {
    sharedPreferences ??= await SharedPreferences.getInstance();
    await sharedPreferences!.setBool('isLoggedIn', isLoggedIn);
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
    print('/********************************************/');
    print(user.user!.uid);
    UserDataModel.userId = user.user!.uid;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('userId', UserDataModel.userId!);
    await saveLoginState(true);
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}


class CheckBoxWidet extends StatefulWidget {
  const CheckBoxWidet({super.key});

  @override
  State<CheckBoxWidet> createState() => _CheckBoxWidetState();
}

class _CheckBoxWidetState extends State<CheckBoxWidet> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.black;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}