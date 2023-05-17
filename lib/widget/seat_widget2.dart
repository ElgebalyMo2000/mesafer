import 'package:flutter/material.dart';


Widget SeatsWidget2(List<dynamic>seatStateAvalible) {

  
  bool isSelected = false;
  List<Seat> seats = List.generate(
    32,
    (index) => Seat(
      index: ++index,
      isAvailable: seatStateAvalible[--index],
      isSelected: isSelected,
      color:seatStateAvalible[index++]?Colors.grey:Colors.red,
    ),
    
  );

  void colorChange(int seatIndex) {
    if (seats[seatIndex].isAvailable) {
      
        if (seats[seatIndex].isSelected) {
          seats[seatIndex].isSelected = false;
          seats[seatIndex].color = Colors.grey;
        } else {
          seats[seatIndex].isSelected = true;
          seats[seatIndex].color = Colors.green;
        }
      
    } else {
      seats[seatIndex].color = Colors.red;
    }
  }

  return StatefulBuilder(
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
                    int seatIndex=rowIndex*4 + columnIndex;
                    return Expanded(
                    
                    child: GestureDetector(
                      child: Column(
                        children: [
                          Text(
                              seats[seatIndex].index.toString(),
                              style: TextStyle(
                                fontSize: 12,
                              ),
                          ),
                          Icon(
                            Icons.chair,
                            color: seats[rowIndex * 4 + columnIndex].color!,
                            size: 40,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          colorChange(rowIndex * 4 + columnIndex);
                          print(seatStateAvalible);
                        },);
                        
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
  );
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
