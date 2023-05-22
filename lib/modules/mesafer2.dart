import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mesafer/models/ticket_details_model.dart';
import 'package:mesafer/models/trip_model.dart';
import 'package:mesafer/pages/personal_info_page.dart';
import '../widget/ticket_widget.dart';

class ChooseTicket extends StatefulWidget {
  Map<String, dynamic> ticket;
  ChooseTicket({Key? key, required this.ticket}) : super(key: key);

  @override
  State<ChooseTicket> createState() => _ChooseTicketState();
}

class _ChooseTicketState extends State<ChooseTicket> {
  bool isSelected = false;
  List<Seat>? seats;
  int? seatnum;

  void colorChange(int seatIndex) {
    seatnum=seatIndex++;
    if (seats![seatIndex].isAvailable) {
      if (seats![seatIndex].isSelected) {
        seats![seatIndex].isSelected = false;
        seats![seatIndex].color = Colors.grey;
      } else {
        seats![seatIndex].isSelected = true;
        seats![seatIndex].color = Colors.green;
      }
    } else {
      seats![seatIndex].color = Colors.red;
    }
  }
/* void colorChange(int seatIndex) {
  if (seats![seatIndex].isAvailable) {
    if (seats![seatIndex].isSelected) {
      // Seat was previously selected, so deselect it
      seats![seatIndex].isSelected = false;
      seats![seatIndex].color = Colors.grey;
      
      
      
      // Update the Firestore document
      FirebaseFirestore.instance.collection('trips').doc('${widget.ticket['docId']}').update({
        'seats.${seatIndex}': false,
      });
    } else {
      // Seat was not selected, so select it
      seats![seatIndex].isSelected = true;
      seats![seatIndex].color = Colors.green;
      
     
      
      // Update the Firestore document
      FirebaseFirestore.instance.collection('trips').doc('${widget.ticket['docId']}').update({
        'seats.${seatIndex}': true,
      });
    }
  } else {
    seats![seatIndex].color = Colors.red;
  }
}*/
/*void updateSeatData(int seatIndex, bool isSelected) {

  FirebaseFirestore.instance
      .collection('trips')
      .doc('${widget.ticket['docId']}')
      .update({
        'seats.${seatIndex}': isSelected,
      })
      .then((value) {
        print('Seat data updated successfully');
      })
      .catchError((error) {
        print('Failed to update seat data: $error');
      });
}
void colorChange(int seatIndex) {
  if (seats![seatIndex].isAvailable) {
    setState(() {
      bool newSelectedState = !seats![seatIndex].isSelected;
      seats![seatIndex].isSelected = newSelectedState;
      seats![seatIndex].color = newSelectedState ? Colors.green : Colors.grey;
    });

    updateSeatData(seatIndex, seats![seatIndex].isSelected);
  } else {
    seats![seatIndex].color = Colors.red;
  }
}*/

  listenData() async {
    FirebaseFirestore.instance.collection('trips').snapshots().listen((event) {
      event.docs.forEach((element) {});
    });
  }

  List trip = [];
  int? index;

  @override
  void initState() {
    // TODO: implement initState

    trip = widget.ticket['trip'];

    listenData();

    setState(() {
      // print(trip);
      print('==========================================================');
      print(trip[0]['seats']);
    });
    seats = List.generate(
      32,
      (index) => Seat(
        index: ++index,
        isAvailable: trip[0]['seats']![--index],
        isSelected: isSelected,
        color: trip[0]['seats']![index++] ? Colors.grey : Colors.red,
      ),
    );

    super.initState();
  }

  late TicketDetails ticketDetails;

  /* fillTicketData(){
    ticketDetails = TicketDetails(business:'Business' ,date: '${trip[0]['start_time'][0]}',destination:'${widget.ticket['destination']}' ,source:'${widget.ticket['source']}' ,duration: '${trip[0]['duration'][0]}'  ,trainNumber: '${trip[0]['train_number'][0]}');
  }*/

  fillTripData() {
    TripModel.source = '${widget.ticket['source']}';
    TripModel.business = 'Business';
    TripModel.destination = '${widget.ticket['destination']}';
    TripModel.date = '${widget.ticket['departureDate']}';
    TripModel.startTime = '${trip[0]['start_time'][0]}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        title: const Text(
          'Choose Ticket',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
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
            ])),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).cardColor,
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.train,
                          color: Colors.orangeAccent.withOpacity(0.5),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${widget.ticket['source']}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 20,
                          color: Colors.orangeAccent.withOpacity(0.5),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          '${widget.ticket['destination']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Travelers : ${widget.ticket['passengers']}'.padLeft(20),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            ticketWidget(TicketDetails(
              date:
                  '${trip[0]['start_time'][0]} ==> ${trip[0]['arival_time'][0]}',
              duration: '${trip[0]['duration'][0]}',
              business: '${trip[0]['price'][1]}',
              economy: '${trip[0]['price'][0]}',
              trainNumber: '${trip[0]['train_number'][0]}',
            )),
            ticketWidget(TicketDetails(
              date:
                  '${trip[0]['start_time'][1]} ==> ${trip[0]['arival_time'][1]}',
              duration: '${trip[0]['duration'][1]}',
              business: '${trip[0]['price'][1]}',
              economy: '${trip[0]['price'][0]}',
              trainNumber: '${trip[0]['train_number'][1]}',
            )),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                  child: Text(
                'Choose your seat position',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
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
                    SizedBox(
                      height: 50,
                    ),
                    Icon(
                      Icons.chair,
                      color: Colors.grey,
                      size: 40,
                    ),
                    Text('Available'),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.chair,
                      color: Colors.red,
                      size: 40,
                    ),
                    Text('Not Available'),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),

                // SeatsWidget2(trip[0]['seats']!),
                StatefulBuilder(
                  builder: (context, StateSetter setState) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.60,
                      height: MediaQuery.of(context).size.height * 0.55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.black.withOpacity(.5),
                          width: 1.25,
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            8,
                            (rowIndex) => Row(
                              children: List.generate(
                                4,
                                (columnIndex) {
                                  int seatIndex = rowIndex * 4 + columnIndex;
                                  return Expanded(
                                    child: GestureDetector(
                                      child: Column(
                                        children: [
                                          Text(
                                            seats![seatIndex].index.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          Icon(
                                            Icons.chair,
                                            color: seats![
                                                    rowIndex * 4 + columnIndex]
                                                .color!,
                                            size: 40,
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        setState(
                                          () {
                                            colorChange(
                                                rowIndex * 4 + columnIndex);

                                            print(trip[0]['seats']!);
                                          },
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                fillTripData();
                print("seat index :  ${seatnum}");
                seatnum=TripModel.seatNum;
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return PersonalInfo(ticket: {
                      'passengers': '${widget.ticket['passengers']}',
                      'source': '${widget.ticket['source']}',
                      'destination': '${widget.ticket['destination']}',
                      'departureDate': '${widget.ticket['departureDate']}',
                      'docId': '${widget.ticket['docId']}',
                      'trainNumber': '${trip[0]['train_number'][1]}',
                      'price': '${trip[0]['price'][1]}',
                      'startDate': '${trip[0]['start_time'][0]}',
                      'seatIndex':seatnum,
                    });
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: MediaQuery.of(context).size.width * .5,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 235, 180, 117),
                ),
                child: Center(
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Seat {
  int index;
  bool isAvailable;
  bool isSelected;
  Color? color;

  Seat({
    required this.index,
    required this.isAvailable,
    required this.isSelected,
    required this.color,
  });
}
