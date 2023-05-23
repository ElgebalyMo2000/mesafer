import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mesafer/models/ticket_details_model.dart';
import 'package:mesafer/modules/mesafer2.dart';

class booking_screen extends StatefulWidget {
  @override
  State<booking_screen> createState() => _booking_screenState();
}

class _booking_screenState extends State<booking_screen> {
  List<String> places = [
    'Cairo',
    'Alex',
    'Zagazig',
    'Mansora',
    'Aswan',
    'Menia',
    'Banha',
  ];

  DateTime? departureDate;

  String source = ' source';
  String destination = 'destination';

  int passengers = 1;

  String? tripId;
  Stream<QuerySnapshot> stream =
      FirebaseFirestore.instance.collection('trips').snapshots();
  StreamSubscription<QuerySnapshot>? subscription;

  TicketDetails? ticketDetails;
  List TripInfo = [];
  void listenToTrips() {
    CollectionReference tripRef =
        FirebaseFirestore.instance.collection('trips');
    stream = tripRef
        .where('source', isEqualTo: source)
        .where('destination', isEqualTo: destination)
        .snapshots();

    stream.listen((snapshot) {
      setState(() {
        TripInfo = snapshot.docs.map((doc) => doc.data()).toList();
      });
    });
  }

  getData() async {
    CollectionReference tripRef =
        FirebaseFirestore.instance.collection('trips');
    await tripRef
        .where('source', isEqualTo: source)
        .where('destination', isEqualTo: destination)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        tripId = element.id;
        print(tripId);
      });
    });
    listenToTrips();
  }

  getDataInfo() async {
    DocumentReference usersRef =
        FirebaseFirestore.instance.collection('trips').doc(tripId);
    var responseBody = await usersRef.get();

    setState(() {
      TripInfo.add(responseBody.data());
    });
    print(TripInfo);
  }

  //delete documentation
  Future<void> deleteDocuments() async {
    final collectionRef = FirebaseFirestore.instance.collection('trips');

    // Query documents that match the criteria
    final querySnapshot = await collectionRef
        .where('source', isEqualTo: 'Cairo')
        .where('destination', isEqualTo: 'Alex')
        .get();

    // Create a batched write to delete the matching documents
    final batch = FirebaseFirestore.instance.batch();

    querySnapshot.docs.forEach((doc) {
      batch.delete(doc.reference);
    });

    // Commit the batched write
    await batch.commit();
  }

  @override
  void initState() {
    super.initState();

    subscription = stream.listen((data) {
      data.docs.forEach((doc) {
       // print(doc.data());
      });
    });
  }

  @override
  void dispose() {
    subscription!.cancel();
    super.dispose();
  }

// enter new trips in firebase

  CollectionReference tripRef = FirebaseFirestore.instance.collection('trips');
  Future<void> addDocument() async {
    String? source = 'Cairo';
    String? destination = 'Alex';
    String? date = '12/5/2023';
    List<String>? arival_time = ['11:00:00 BM', '6:00 BM'];
    List<String>? start_time = ['9:00:00 AM', '4:00 BM'];
    List<String>? duration = ['2 h', '2 h'];
    List<int>? price = [5, 40];
    List<String>? train_number = ['191', '192'];
    List<bool> seats = List.filled(32, true);

    final data = {
      'source': source,
      'destination': destination,
      'date': date,
      'arival_time': arival_time,
      'start_time': start_time,
      'duration': duration,
      'price': price,
      'train_number': train_number,
      'seats': seats,
    };

    print(data);
    await tripRef.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.orange.withOpacity(0.7),
              Colors.orange.withOpacity(0.5),
              Colors.orange.withOpacity(0.3),
              Colors.orange.withOpacity(0.1),
            ])),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.07,
                bottom: MediaQuery.of(context).size.height * 0.03,
                right: 8,
                left: 8,
              ),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).cardColor,
                            ),
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'From',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    Icon(
                                      Icons.train_sharp,
                                      color:
                                          Colors.orangeAccent.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                                StatefulBuilder(builder: (context, onState) {
                                  return PopupMenuButton(
                                    initialValue: source,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    onSelected: (nValue) {
                                      onState(() {
                                        source = nValue.toString();
                                      });
                                    },
                                    position: PopupMenuPosition.under,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey))),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 30,
                                          ),
                                          Text(
                                            source,
                                          ),
                                        ],
                                      ),
                                    ),
                                    itemBuilder: (context) => List.generate(
                                      places.length,
                                      (index) => PopupMenuItem(
                                        value: places[index],
                                        child: Text(
                                          places[index],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                                const SizedBox(height: 1),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).cardColor,
                            ),
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SingleChildScrollView(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        ' To',
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                                      Icon(
                                        Icons.train_sharp,
                                        color: Colors.orangeAccent
                                            .withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                ),
                                StatefulBuilder(builder: (context, onState) {
                                  return PopupMenuButton(
                                    initialValue: destination,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    onSelected: (nValue) {
                                      onState(() {
                                        destination = nValue.toString();
                                      });
                                    },
                                    position: PopupMenuPosition.under,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey))),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 30,
                                          ),
                                          Text(
                                            destination,
                                          ),
                                        ],
                                      ),
                                    ),
                                    itemBuilder: (context) => List.generate(
                                      places.length,
                                      (index) => PopupMenuItem(
                                        value: places[index],
                                        child: Text(
                                          places[index],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                                const SizedBox(height: 1),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      width: 60,
                      height: 60,
                      left: (MediaQuery.of(context).size.width / 2) - 37,
                      bottom: (MediaQuery.of(context).size.height * 0.2) / 3,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orangeAccent,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            CupertinoIcons.resize_h,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).cardColor,
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Departure Date',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  StatefulBuilder(builder: (context, onState) {
                    return TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            departureDate == null
                                ? 'Select Date'
                                : DateFormat.yMMMd().format(departureDate!),
                            style: const TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const Icon(
                            Icons.date_range,
                          ),
                        ],
                      ),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          helpText: 'Publish Date',
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year + 1),
                          confirmText: 'SET',
                        ).then((value) {
                          if (value != null) {
                            onState(() {
                              departureDate = value;
                            });
                          }
                        });
                      },
                    );
                  }),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).cardColor,
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Passengers',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  StatefulBuilder(builder: (context, onState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            onState(() {
                              if (passengers > 1) {
                                --passengers;
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orangeAccent.shade100,
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(8),
                            child: const Icon(CupertinoIcons.minus),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            passengers.toString(),
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onState(() {
                              if (passengers < 10) {
                                passengers++;
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orangeAccent.shade100,
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(8),
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.2,
                  vertical: 30),
              child: ElevatedButton(
                onPressed: () async {
                   if (passengers == null ||
                      source == null ||
                      destination == null ||
                      departureDate == null 
                      ) {
                   
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Please fill in all the required information.'),
                      ),
                    );
                  } else {
                    await getData();
                    await getDataInfo();
                    //await addDocument();
                    // await deleteDocuments();

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ChooseTicket(ticket: {
                          'passengers': passengers.toString(),
                          'source': source,
                          'destination': destination,
                          'departureDate':
                              '${departureDate!.day}/${departureDate!.month}/${departureDate!.year}',
                          'docId': tripId,
                          'trip': TripInfo,
                        });
                      },
                    ));
                  }
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 8)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.orangeAccent),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
                ),
                child: const Text(
                  'SEARCH',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
