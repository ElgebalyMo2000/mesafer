 import 'package:flutter/material.dart';

import '../models/ticket_details_model.dart';

 
 Widget ticketWidget(TicketDetails ticket) {
   
  double? height;
  String ? groupVal1;
  
  return StatefulBuilder(
    builder: (context,StateSetter setState) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: Colors.grey)
        ),
        margin:const EdgeInsets.all(8),
        child: Column(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text(ticket.date??'',
                        style:const TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('   ${ticket.duration} hur ',
                            style:const TextStyle(
                              fontSize:14,

                            ),
                          ),
                          Text('Train : ${ticket.trainNumber}'.padLeft(20),
                            style:const TextStyle(
                              fontSize:14,

                            ),
                          ),
                          const SizedBox(width: 8,)
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      setState((){
                        if(height==0){
                          height=null;
                        }else{
                          height=0;
                        }
                      });
                    },
                    child: Container(
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(8)),
                        color: Colors.orangeAccent,
                      ),
                      padding:const EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:const [
                          Text('Price',
                            style: TextStyle(
                                fontSize:20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_up,size: 30,color: Colors.white,)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.black,),
            AnimatedContainer(
              duration:const Duration(milliseconds: 500),
              height: height,
              child: Column(
                children: [
                  Row(
                    children:[
                      Expanded(
                        flex: 2,
                        child: Row(
                          children:const [
                            SizedBox(width: 8,),
                            Icon(Icons.train),
                            Text('  Business ',
                              style:TextStyle(
                                fontSize:20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration:const BoxDecoration(
                              border: Border(left: BorderSide(color: Colors.grey))
                          ),
                          child: Row(
                            children: [
                              Radio(
                                value: '${ticket.business} EGP',
                                groupValue: groupVal1,
                                onChanged: (String? value){
                                  setState((){
                                   groupVal1=value;
                                  });
                                  
                                 
                                   
                                   print('*******************');
                                 
                                },
                                activeColor: Colors.orangeAccent,
                              ),
                              Text('${ticket.business} EGP',

                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children:[
                      Expanded(
                        flex: 2,
                        child: Row(
                          children:const [
                            SizedBox(width: 8,),
                            Icon(Icons.airplane_ticket),
                            Text('  Economy  ',
                              style:TextStyle(
                                fontSize:20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration:const BoxDecoration(
                              border: Border(left: BorderSide(color: Colors.grey))
                          ),
                          child: Row(
                            children: [
                              
                              Radio(
                                value: '${ticket.economy} EGP',
                                groupValue: groupVal1,
                                onChanged: (String?value){
                                  setState((){
                                    groupVal1=value;
                                    
                                  });
                                  print(groupVal1);
                                  print('${ticket.economy} EGP');

                                },
                                activeColor: Colors.orangeAccent,
                              ),
                              Text('${ticket.economy} EGP',

                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      );
    }
  );
}

