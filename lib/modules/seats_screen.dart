import 'package:flutter/material.dart';

import '../widget/seat_widget2.dart';


class SeatsScreen extends StatelessWidget {
   SeatsScreen({super.key});
   bool isSelected = false;
  List<Seat>? seats;

  void colorChange(int seatIndex) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
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

                                           // print(trip[0]['seats']!);
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
    );
  }
}
