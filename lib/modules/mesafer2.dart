import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mesafer/models/ticket_details_model.dart';
import 'package:mesafer/pages/personal_info_page.dart';
import 'package:rxdart/rxdart.dart';


import '../models/user_data_model.dart';
import '../widget/seat_widget2.dart';
import '../widget/ticket_widget.dart';



class ChooseTicket extends StatefulWidget {
  Map<String,dynamic> ticket;
  ChooseTicket({Key? key,required this.ticket}) : super(key: key);

  @override
  State<ChooseTicket> createState() => _ChooseTicketState();
}

class _ChooseTicketState extends State<ChooseTicket> {
  listenData()async{
    FirebaseFirestore.instance.collection('trips').snapshots().listen((event) {
        event.docs.forEach((element) {
         
        });
     });
  }
  //late StreamController<List> _seatsStreamController;
 List trip = [];
  //late Stream<List> tripStream;
 
  @override
  void initState() {
    // TODO: implement initState
      
     trip =  widget.ticket['trip'];
     //_seatsStreamController = BehaviorSubject<List>.seeded(trip[0]['seats']);
     listenData();
    
     setState(() {
        print(trip);
     print('==========================================================');
     print(trip[0]['seats']);
     });
    
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Colors.white,size: 30),
        title:const Text('Choose Ticket',
          style: TextStyle(fontSize: 25,color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                   Color.fromARGB(255, 235, 180, 117), 
                   Color.fromARGB(255, 241, 224, 206),
                ]
            )
        ),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).cardColor,
              ),
              margin:const EdgeInsets.all(8),
              padding:const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.train,
                          color: Colors.orangeAccent.withOpacity(0.5),
                        ),
                        const SizedBox(width: 8,),
                        Text('${widget.ticket['source']}',
                          style:const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        const SizedBox(width: 16,),
                        Icon(Icons.arrow_forward,size: 20,color: Colors.orangeAccent.withOpacity(0.5),),
                        const SizedBox(width: 16,),
                        Text('${widget.ticket['destination']}',
                          style:const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Text('Travelers : ${widget.ticket['passengers']}'.padLeft(20),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            ticketWidget(TicketDetails(
              date: '${trip[0]['start time'][0]} ==> ${trip[0]['arival_time'][0]}',
              duration: '${trip[0]['duration'][0]}',
              business: '${trip[0]['price'][0]}',
              economy: '${trip[0]['price'][1]}',
              trainNumber: '${trip[0]['train_number'][0]}',
            )),
            ticketWidget(TicketDetails(
              date: '${trip[0]['start time'][1]} ==> ${trip[0]['arival_time'][1]}',
              duration: '${trip[0]['duration'][1]}',
              business: '${trip[0]['price'][0]}',
              economy:'${trip[0]['price'][1]}',
              trainNumber: '${trip[0]['train_number'][1]}',
            )),
           
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),

              ),
              child: Center(child: Text('Choose your seat position',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
            ),
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Column(
                children: [
                  Icon(
                      Icons.chair,
                      color: Colors.green,
                      size: 40,
                    ),
                  Text('Your seat'),
                  SizedBox(height: 50,),
                   Icon(
                      Icons.chair,
                      color: Colors.grey,
                      size: 40,
                    ),
                  Text('Available'),
                  SizedBox(height: 10,),
                   Icon(
                      Icons.chair,
                      color: Colors.red,
                      size: 40,
                    ),
                  Text('Not Available'),

                ],
               ),
               SizedBox(width: MediaQuery.of(context).size.width*0.1,),
              SeatsWidget2(trip[0]['seats']),
             ],
           ),

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return PersonalInfo(ticket: {
                              'passengers': '${widget.ticket['passengers']}',
                              'source': '${widget.ticket['source']}',
                              'destination': '${widget.ticket['destination']}',
                              'departureDate': '${widget.ticket['departureDate']}',
                              'docId':'${widget.ticket['docId']}',
                              
                            });
                          },
                        ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                  width: MediaQuery.of(context).size.width*.5,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 235, 180, 117),
                  ),
                  child: Center(child: Text('NEXT',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),),
                ),
            )
          ],
        ),
      ),
    );
  }
}
 