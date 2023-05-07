import 'package:flutter/material.dart';
import 'package:mesafer/models/ticket_details_model.dart';
import 'package:mesafer/pages/personal_info_page.dart';
import 'package:mesafer/widget/seats_widget.dart';


class ChooseTicket extends StatelessWidget {
  Map<String,dynamic> ticket;
  ChooseTicket({Key? key,required this.ticket}) : super(key: key);

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
                        Text('${ticket['source']}',
                          style:const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        const SizedBox(width: 16,),
                        Icon(Icons.arrow_forward,size: 20,color: Colors.orangeAccent.withOpacity(0.5),),
                        const SizedBox(width: 16,),
                        Text('${ticket['destination']}',
                          style:const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Text('Travelers : ${ticket['passengers']}'.padLeft(20),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            ticketWidget(TicketDetails(
              date: '  12:00 -> 14:30',
              duration: '2:30',
              business: '60',
              economy: '10',
              trainNumber: '0123',
            )),
            ticketWidget(TicketDetails(
              date: '  07:30 -> 09:30',
              duration: '2',
              business: '60',
              economy: '10',
              trainNumber: '0135',
            )),
            ticketWidget(TicketDetails(
              date: '  04:00 -> 06:30',
              duration: '2',
              business: '60',
              economy: '10',
              trainNumber: '8575',
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

           //seats position
          /* Container(
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
                    '${ticket['source']}',
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
                    '${ticket['destination']}',
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
                  Text('01/01/2022',style: TextStyle(color: Colors.black87,fontSize: 18),),
                  SizedBox(width: MediaQuery.of(context).size.width*0.5),

                 Text('Economy',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                 
                ],
              ),
              SizedBox(height: 10,),
              ],
            )),*/

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
              SeatsWidget(),
              
               
             ],
           ),




           

            GestureDetector(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => PersonalInfo(),));
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
ticketWidget(TicketDetails ticket){
  double? height;
  String ? groupVal1;
  return StatefulBuilder(
    builder: (context,onState) {
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
                      onState((){
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
                                value: 'value',
                                groupValue: groupVal1,
                                onChanged: (String? value){
                                  
                                  groupVal1=value;
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
                                value: 'value',
                                groupValue: 'groupValue',
                                onChanged: (value){},
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