import 'package:flutter/material.dart';

class TicketItem extends StatelessWidget {
   TicketItem({super.key, required this.ticketNumber, required this.source, required this.destination, required this.date});

  final int ticketNumber;
  final String source;
  final String destination;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
               borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Colors.black.withOpacity(.5),
                      width: 1.25
                    )

            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*.075,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 242, 168, 81),
                    
                    border: Border(
                       bottom: BorderSide(color: Colors.black.withOpacity(1),width: 1.25),
                       
                    )
                  ),
                  
                  child: Center(child: Text('Ticket $ticketNumber',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
            
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(' Departure',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 29,
                        color: Colors.black),
                  ),
                  ],
                ),
                SizedBox(height: 10,),
                 Row(
                children: [
                  Icon(Icons.train, color: Color.fromARGB(255, 242, 168, 81),size: 30,),
                  Text(
                    '$source',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    size: 30,
                    color: Color.fromARGB(255, 242, 168, 81),
                  ),
                  Text(
                    '$destination',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                
                children: [
                  Text('$date',style: TextStyle(color: Colors.black87,fontSize: 18),),
                  SizedBox(width: MediaQuery.of(context).size.width*0.5),

                 Row(
                  children: [
                    Text('Details',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                    Icon(Icons.double_arrow,color: Colors.black,size: 20,),
                  ],
                 )
                ],
              ),
              SizedBox(height: 10,),
              ],
            ));
  }
}


