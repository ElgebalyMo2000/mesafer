

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesafer/cubit/cubit.dart';
import 'package:mesafer/cubit/states.dart';

class SeatsWidget extends StatelessWidget {

  
  

void colorChange(){

    }

  @override
  Widget build(BuildContext context) {
    return  Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          width:MediaQuery.of(context).size.width*0.57,
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border:
                Border.all(color: Colors.black.withOpacity(.5), width: 1.25),
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Row(
                children: [
                 GestureDetector(
                    child: Icon(
                      Icons.chair,
                      color: Colors.grey,
                      size: 40,
                    ),
                    onTap: colorChange,
                  ),
                  SizedBox(width: 5,),
                   GestureDetector(
                    child: Icon(
                      Icons.chair,
                      color: Colors.grey,
                      size: 40,
                    ),
                    onTap: colorChange,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.chair,
                      color: Colors.grey,
                      size: 40,
                    ),
                    onTap: colorChange,
                  ),
                  SizedBox(width: 5,),
                   GestureDetector(
                    child: Icon(
                      Icons.chair,
                      color: Colors.grey,
                      size: 40,
                    ),
                    onTap: colorChange,
                  ),
                ],
              );
            },
            itemCount: 9,
          ),
        );
  }
}
      
      
      
      
      
      
      
      
      
      
      
      
      
     
