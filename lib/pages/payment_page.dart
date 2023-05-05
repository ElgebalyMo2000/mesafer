import 'package:flutter/material.dart';
import 'package:mesafer/pages/booking_page.dart';


class PaymentPage extends StatelessWidget {
   PaymentPage({super.key});
  bool rv = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar: AppBar(
        title: Text('Payment',style: TextStyle(color: Colors.white,fontSize: 30),),
        
        backgroundColor: Color.fromARGB(255, 235, 180, 117),
        elevation: 0,
       
      ),
      
      body: SingleChildScrollView(
        child: Container(
           decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 235, 180, 117), 
            Color.fromARGB(255, 241, 224, 206),
            ],),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
              Container(
                //height: MediaQuery.of(context).size.height*.5,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
        
                  children: [
                    Text('Payment Details',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black26,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*.7,
                            child: Image.asset('assets/payment_methods.PNG',scale:1 )),
                          Transform.scale(
                            scale: 2,
                            child: Radio(value: false, groupValue: rv, onChanged: (value) {
                              rv!=value;
                            },
                            activeColor: Colors.amber,
                            
                            splashRadius: 30,
                            
                            ),
                          ),
                          
                        ],
                      ),
        
                    ),
                    SizedBox(height: 10,),
                    Text('Card Number *',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    TextField(),
                    SizedBox(height: 10,),
                    Text('CVV * ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    TextField(),
                    SizedBox(height: 10,),
                    Text('Expire Date* ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    TextField(
                      
                      decoration: InputDecoration(
                        hintText: 'mm',
                      ),
                    )
        
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height*.15 ,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 30, 153, 100),
                    borderRadius: BorderRadius.circular(10),
                ),
        
                
                child: Row(
                  children: [
                    Text('Total Price:      10 EGP',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.04,),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => BookingPage(),));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    height:MediaQuery.of(context).size.width*0.13 ,
                    margin: EdgeInsets.only(bottom: 10),
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      
                      color:  Color.fromARGB(255, 242, 168, 81)
                    ),
                    child: Center(child: Text('Pay',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
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