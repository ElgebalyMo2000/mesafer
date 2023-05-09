import 'package:flutter/material.dart';
import 'package:mesafer/pages/signin_page.dart';
import 'package:mesafer/shared/components/components.dart';

class on_boarding extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/1.jpeg'),
          fit: BoxFit.cover,
          ), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
           children: 
           [
          Text('Start booking your ticket away from the crowded stations in an easy and simple way',
          style: TextStyle(
          fontSize: 27.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          ),
          ),
          SizedBox(height: 0.0,),
          Text('           ابدا بحجز تذكرتك بعيدا عن ازدحام',
          style: TextStyle(
          fontSize: 27.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,

          ),
          ),
          SizedBox(height: 0.0,),
          Text('                 المحطات بطريقه سهله, بسيطه',
          style: TextStyle(
          fontSize: 27.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          ),
          ),
          SizedBox(height: 80.0,),
          Text('Register and book now',
          style: TextStyle(
          fontSize: 27.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          ),
          ),
          SizedBox(height: 0.0,),
           Text('سجل و احجز الان ',
          style: TextStyle(
          fontSize: 27.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          ),
          ),
          SizedBox(height: 15.0,),
          IconButton(onPressed: (){
          Navigator.push( context, 
          MaterialPageRoute(builder: (context)=> SignInPage()),);
          },
           icon: Icon(Icons.arrow_forward_rounded,
           size: 60.0,
           )
           ),
           ],
          ),
          
        ],
      ),
     ),
      
     );
}
 }
