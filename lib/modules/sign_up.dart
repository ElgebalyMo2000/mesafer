import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesafer/cubit/register_cubit/register_cubit.dart';
import 'package:mesafer/layout/mesafer_layout.dart';
import 'package:mesafer/models/user_data_model.dart';
import 'package:mesafer/modules/login_screen.dart';
import 'package:mesafer/shared/components/components.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Sign_up extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastnameController = TextEditingController();
  var emailController = TextEditingController();
  var createpassordController = TextEditingController();
  var confirmpassordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? gender;
  String? nationalId;
  String? phoneNumber;
  String? email;
  String? password;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
         if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => mesafer_layout()),
          );
          isLoading = false;
        } else if (state is RegisterFailure) {
          showSnakebarMethod(context, 'Something went wrong');
          isLoading = false;
        }
        else if(state is GoToSignInState){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
         else {
          showSnakebarMethod(context, 'state.errMessage');
          isLoading = false;
        }
      },
      builder: (context, state) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                                            onchange: (String value) {
                                              firstName = value;
                                              print(value);
                                            },
                                            label: Text(
                                              'First name',
                                              style: TextStyle(
                                                  color: Colors.grey, fontSize: 20.0),
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
                                            onSubmitte: (String value) {
                                              print(value);
                                            },
                                            onchange: (String value) {
                                              lastName = value;
                                              print(value);
                                            },
                                            label: Text(
                                              'Last name',
                                              style: TextStyle(
                                                  color: Colors.grey, fontSize: 20.0),
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
                                    height: 15.0,
                                  ),
                                  defaultFormField(
                                    controller: createpassordController,
                                    type: TextInputType.visiblePassword,
                                    onSubmitte: (String value) {
                                      print(value);
                                    },
                                    onchange: (String value) {
                                      password = value;
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
                                    onchange: (String value) {
                                      confirmPassword = value;
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
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                    BlocProvider.of<RegisterCubit>(context)
                                    .registerUser(
                                        firstName: firstName!,
                                        lastName: lastName!,
                                        emai: email!,
                                        password: password!,
                                        confirmPassword: confirmPassword!);
                              }
                              else{}
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
                            BlocProvider.of<RegisterCubit>(context).gotoSignin();
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
      },
    );
  }
}
