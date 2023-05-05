import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesafer/cubit/states.dart';
import 'package:mesafer/layout/mesafer_layout.dart';
import 'package:mesafer/modules/Booking_screen.dart';
import 'package:mesafer/modules/More_screen.dart';
import 'package:mesafer/modules/Profile_screen.dart';
import 'package:mesafer/modules/Trips_screen.dart';

class AppCubit   extends Cubit< AppStates>{
  AppCubit() : super(AppinitilaState());
  
  static AppCubit get(context)=>BlocProvider.of(context);
   
   int currentIndex = 0 ;
 
  List<Widget> ButtomScreen  = [
    booking_screen(),
    trips_screen(),
    profile_screen(),
    More_screen(),
  ];
  
 

  void ChangeBottomNavigationBar(int index){
   currentIndex =index;
   emit(AppChangeBottomNavigationBar());
  }

  void chooseSeatPositin(Color? seatColor){
    if(seatColor == Colors.red){
          emit(ChooseSeatRed());
        }
        else if(seatColor==Colors.grey){
          emit(ChooseSeatGreen());
        }
        else if(seatColor==Colors.green){
          emit(ChooseSeatGreen());
        }

  }
  
  
 }

