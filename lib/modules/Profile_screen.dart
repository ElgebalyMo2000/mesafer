import 'package:flutter/material.dart';
import 'package:mesafer/shared/components/components.dart';

import '../models/user_data_model.dart';
import 'notifications_screen.dart';


class profile_screen extends StatelessWidget {

  String? firstName = 'ahmed';
  String? lastName = 'ali';
  String? dateOfBirth='20/8/2000';
  String? gender= 'male';
  String? nationalId = '24856765486';
  String? phoneNumber = '01256348646';
  String? email = 'ekknihi@gmail.com';
  String? password = '13527546jkhcudchu';



  
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
     
      
      body: SingleChildScrollView(
        child:Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 7),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),

       

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Personal Information',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                 Text('First Name *',style:TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
                   defaultFormField2(
                    controller: TextEditingController(text: firstName),
                   ),
                    SizedBox(height: 5,),
                    
                     Text('Last Name *',style:TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
                   defaultFormField2(
                    controller: TextEditingController(text: lastName),
                   ),

                    SizedBox(height: 5,),

                     Text('Date of Birth *',style:TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
                   defaultFormField2(
                    controller: TextEditingController(text: dateOfBirth),
                   ),

                    SizedBox(height: 5,),

                     Text('Gender *',style:TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
                    defaultFormField2(
                      controller: TextEditingController(text: gender),
                    ),

                    SizedBox(height: 5,),

                     Text('National Id *',style:TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
                   defaultFormField2(
                    controller: TextEditingController(text: nationalId),
                   ),

                    SizedBox(height: 5,),

                     Text('Phone Number *',style:TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
                   defaultFormField2(
                    controller: TextEditingController(text: phoneNumber),
                   ),

                    SizedBox(height: 5,),

                     Text('E-Mail *',style:TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
                   defaultFormField2(controller: TextEditingController(text: email)),
                   SizedBox(height: 5,),
                     Text('Password *',style:TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
                   defaultFormField2(
                    controller: TextEditingController(text: password),
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                   Center(
              child: GestureDetector(
                onTap: () {
                  // Pay Function
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  height:MediaQuery.of(context).size.width*0.13 ,
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    
                    color:  Color.fromARGB(255, 242, 168, 81),
                  ),
                  child: Center(child: Text('UPDATE INFO',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
                ),
              ),
            ),
                
              ],
          ),
        ) ,
      )
    );
  }
}