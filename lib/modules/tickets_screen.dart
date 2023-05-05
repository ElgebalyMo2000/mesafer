import 'package:flutter/material.dart';
import 'package:mesafer/modules/Trips_screen.dart';

import '../models/ticket_details_model.dart';
import '../widget/ticket_item.dart';


class TicketsScreen extends StatelessWidget {
   

  final List<TicketDetails> ticketData;

  const TicketsScreen({super.key, required this.ticketData});

  @override
  Widget build(BuildContext context) {
   if(ticketData.isEmpty){
    return Center(
      child: Text('you have no tickets yet',style: TextStyle(fontSize: 40),),
    );
   }
   else{

    return Scaffold(

      body: ListView.builder(
        itemBuilder: (context, index) {
          return TicketItem(
            ticketNumber:index++ ,
            source:ticketData[index].source! ,
            destination:ticketData[index].destination! , 
            date: ticketData[index].date!,
          );
        },
        itemCount: ticketData.length,
        
        
        ),
    );
  }
  }
}