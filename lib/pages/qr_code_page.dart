import 'package:flutter/material.dart';
import 'package:mesafer/modules/Booking_screen.dart';

import '../layout/mesafer_layout.dart';


class QRCodePage extends StatelessWidget {
  const QRCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking',style: TextStyle(color: Colors.white,fontSize: 30),),
        
        backgroundColor: Color.fromARGB(255, 235, 180, 117),
        elevation: 0,
       
      ),
      
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          Color.fromARGB(255, 235, 180, 117), 
          Color.fromARGB(255, 241, 224, 206),
          ],),
        ),
        child: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/qrcode.png',scale: 0.8,),
               SizedBox(height: MediaQuery.of(context).size.height*.07,),
                Center(
            child: GestureDetector(
              onTap: () {
                 Navigator.push( context, 
            MaterialPageRoute(builder: (context)=> mesafer_layout()),);
            },
              
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
                height:MediaQuery.of(context).size.width*0.14 ,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  
                  color:  Color.fromARGB(255, 242, 168, 81)
                ),
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Back to main page ',style: TextStyle(color: Colors.white,fontSize: 25,),),
                    Icon(Icons.exit_to_app,color: Colors.white,)
                  ],
                ),),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*.07,),
            Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.7,
                height:MediaQuery.of(context).size.width*0.13 ,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  
                  color:  Color.fromARGB(255, 242, 168, 81)
                ),
                child: Center(child: Text('Cancel Booking',style: TextStyle(color: Colors.white,fontSize: 25),),),
              ),
            ),
          ),
            ],
          ),
        ),
      ),

    );
  }
}