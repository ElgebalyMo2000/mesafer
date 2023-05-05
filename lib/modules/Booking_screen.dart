import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mesafer/cubit/cubit.dart';
import 'package:mesafer/cubit/states.dart';
import 'package:mesafer/models/ticket_details_model.dart';
import 'package:mesafer/modules/mesafer2.dart';

class booking_screen extends StatelessWidget {
  List<String> places = [
    'Cairo',
    'Alex',
    'Sharqia',
    'Geza',
    'Mansora',
    'Aswan',
    'Menia',
    'Banha',
  ];

  DateTime? departureDate;

  String source = 'select Source', destination = 'select destination';
  int passengers = 1;
  String? aaa;
  TicketDetails? ticketDetails ;
  void fillTicketData(){
     ticketDetails!.source=source;
     ticketDetails!.destination=destination;
     ticketDetails!.date=departureDate.toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            color: Colors.orangeAccent
                                                .withOpacity(0.5),
                                          ),
                                        ],
                                      ),
                                      StatefulBuilder(
                                          builder: (context, onState) {
                                        return PopupMenuButton(
                                          initialValue: source,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
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
                                          itemBuilder: (context) =>
                                              List.generate(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SingleChildScrollView(
                                        child: Row(
                                          // mainAxisAlignment:
                                          //MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'To',
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
                                      StatefulBuilder(
                                          builder: (context, onState) {
                                        return PopupMenuButton(
                                          initialValue: destination,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
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
                                          itemBuilder: (context) =>
                                              List.generate(
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
                            bottom:
                                (MediaQuery.of(context).size.height * 0.2) / 3,
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
                                      : DateFormat.yMMMd()
                                          .format(departureDate!),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
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
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ChooseTicket(ticket: {
                              'passengers': passengers.toString(),
                              'source': source,
                              'destination': destination,
                              'departureDate': departureDate,
                            });
                          },
                        ));
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
        },
      ),
    );
  }
}
