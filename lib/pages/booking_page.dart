import 'package:flutter/material.dart';
import 'package:mesafer/pages/qr_code_page.dart';

class BookingPage extends StatefulWidget {
   BookingPage({super.key,required this.ticket});
  Map<String,dynamic> ticket;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Booking',style: TextStyle(color: Colors.white,fontSize: 30),),
        
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
                height:  MediaQuery.of(context).size.height*.8,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                   bottom: BorderSide( color: Colors.black45,),
                   top: BorderSide( color: Colors.black45,),
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.orange,
                      height: MediaQuery.of(context).size.height*0.075,
                      child: Row(
                        children: [
                          Icon(Icons.book_online_sharp,size: 40,),
                          SizedBox(width: MediaQuery.of(context).size.width*.15,),
                          Center(child: Text('Booking Summary',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Colors.white))),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('Departure',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Row(
                        children: [
                          Icon(Icons.train,color:Color.fromARGB(255, 242, 168, 81)),
                          Text('${widget.ticket['source']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black45),),
                          Icon(Icons.arrow_right_alt,size: 30,color:Color.fromARGB(255, 242, 168, 81) ,),
                          Text('${widget.ticket['destination']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black45),),
                        ],
                      ),
                      SizedBox(height: 10,),
                    Text('Departure Date:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.black45),),
                    Center(child: Text('${widget.ticket['departureDate']}     ${widget.ticket['startDate']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),)),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.train_outlined,color:Color.fromARGB(255, 242, 168, 81)),
                        Text('Train : ',style:TextStyle (fontSize: 20,fontWeight:FontWeight.bold, color: Colors.black)),
                        Text('${widget.ticket['trainNumber']}',style:TextStyle (fontSize: 20,fontWeight:FontWeight.bold, color: Colors.black)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Class : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black45),),
                        Text('Business',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Center(child: Text('TRAVELER 1:',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 242, 168, 81) ),)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Coach : 01 -  ',style: TextStyle(fontSize: 23),),
                        Text('Seat: 9',style: TextStyle(fontSize: 23),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('Price per Person:   ',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 242, 168, 81) )),
                        Text('${widget.ticket['price']}',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      child: Row(
                        children: [
                          Text('Total Price:  ',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.07,
                              decoration: BoxDecoration(
                                color: Colors.green,
                              ),
                              
                              child: Center(child: Text('${widget.ticket['price']}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:  MediaQuery.of(context).size.height*.07,),
        
               Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => QRCodePage(),));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    height:MediaQuery.of(context).size.width*0.13 ,
                    margin: EdgeInsets.only(bottom: 20),
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      
                      color:  Color.fromARGB(255, 242, 168, 81)
                    ),
                    child: Center(child: Text('Get QR Code',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
                  ),
                ),
                           ),
        
            ]),
        ),
      ),
    );
  }
}