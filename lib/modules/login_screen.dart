import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesafer/cubit/login_cubit/login_cubit.dart';
import 'package:mesafer/layout/mesafer_layout.dart';
import 'package:mesafer/modules/sign_up.dart';
import 'package:mesafer/shared/components/components.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => mesafer_layout(),), (route) => false
          );
          isLoading = false;
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnakebarMethod(context, state.errMessage);
          
        } 
      },
      builder: (context, state) {
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
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                          email =value;
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
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black, width: 4.0),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  " ",
                                                  style: TextStyle(fontSize: 20),
                                                ),
                                              ),
                                            ),
                                          ),
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
                              color: Color.fromARGB(255, 223, 152, 59).withOpacity(0.6),
                              child: MaterialButton(
                                onPressed: () {
                                  if(formKey.currentState!.validate()){
                                  BlocProvider.of<LoginCubit>(context).loginUer(email: email!, password: password!);
                                  }
                                  else{}
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
                                  MaterialPageRoute(builder: (context) => Sign_up()),
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
          ),
        );
      },
    );
  }
}
