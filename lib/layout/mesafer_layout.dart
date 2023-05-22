import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesafer/cubit/cubit.dart';
import 'package:mesafer/cubit/states.dart';
import 'package:mesafer/modules/notifications_screen.dart';

class mesafer_layout extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
       listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            
            body: cubit.ButtomScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){cubit.ChangeBottomNavigationBar(index);},
              items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.train),
                label: 'Booking',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_to_photos_outlined),
                label: 'Trips',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_outlined),
                label: 'Profile',
                
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                label: 'More',
                
              ),
              ],
            ),
          );
        },
        ),
    );
  }
}
