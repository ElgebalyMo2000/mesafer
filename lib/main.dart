import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesafer/cubit/login_cubit/login_cubit.dart';
import 'package:mesafer/cubit/register_cubit/register_cubit.dart';
import 'package:mesafer/layout/mesafer_layout.dart';
import 'package:mesafer/modules/on_boarding.dart';
import 'package:mesafer/shared/Styles/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cubit/cubit.dart';
import 'firebase_options.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool isLoggedIn = sharedPreferences.getBool('isLoggedIn') ?? false;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({required this.isLoggedIn});
  
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(),),
        BlocProvider(create: (context) => RegisterCubit(),),
        BlocProvider(create: (context) => AppCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home:mesafer_layout() ,
        // home: StartWidget,
       home: isLoggedIn ? mesafer_layout() : on_boarding(),
        theme: TheTheme,
      ),
    );
  }
}
