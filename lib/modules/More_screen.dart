import 'package:flutter/material.dart';
import 'package:mesafer/modules/login_screen.dart';


class More_screen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
      
      
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage('assets/more.jpg',),
          fit: BoxFit.cover,
          opacity: .1,
          ),
          
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black87,width: 1.25),
                    )
                  ),
                child: Row(
                  children: [
                    Icon(Icons.person,color: Colors.grey,),
                    SizedBox(width: 10),
                    Text('Contact Us',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black87,width: 1.25),
                    )
                  ),
                child: Row(
                  children: [
                    Icon(Icons.message,color: Colors.grey,),
                    SizedBox(width: 10),
                    Text('About',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black87,width: 1.25),
                    )
                  ),
                child: Row(
                  children: [
                    Icon(Icons.phone_android,color: Colors.grey),
                    SizedBox(width: 10),
                    Text('Your Opinion',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black87,width: 1.25),
                    )
                  ),
                child: Row(
                  children: [
                    Icon(Icons.policy,color: Colors.grey),
                    SizedBox(width: 10),
                    Text('Policy',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black87,width: 1.25),
                    )
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app,color: Colors.grey),
                      SizedBox(width: 10),
                      Text('Log Out',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}