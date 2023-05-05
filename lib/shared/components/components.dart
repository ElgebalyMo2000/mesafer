import 'package:flutter/material.dart';

void navigateAndKill (context,widget) {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget), (route) => false);
}


Widget defaultFormField ({
 TextEditingController? controller,
  TextInputType? type,
  Text ? label,
  IconData ? prefix,

 Function (String) ? onchange,
 Function (String) ? onSubmitte,
 Function ? onPressedIcon,
 //bool ispassord = true,
 bool obscureTexty = false, 
 IconData ? suffix,

}) {
  return TextFormField(
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: onSubmitte, 
  onChanged: onchange,
  validator: (value) {
    if(value!.isEmpty)
       return 'field is requried';
   },
  style: TextStyle(color: Colors.grey),
  obscureText: obscureTexty,
  
  decoration: InputDecoration(
    filled: true,
    fillColor:  Colors.white,
    label: label, 
   border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(5.0) ,
              borderSide: BorderSide(color: Colors.grey , width:8.0, ),
              ),
  ),
  

);
}



Widget defaultFormField2 ({
 TextEditingController? controller,
  TextInputType? type,
  Text ? label,
  IconData ? prefix,
 
 Function (String) ? onchange,
 Function (String) ? onSubmitte,
 Function ? onPressedIcon,
 //bool ispassord = true,
 bool obscureTexty = false, 
 IconData ? suffix,

}) {
  return TextFormField(
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: onSubmitte, 
  onChanged: onchange,
  validator: (value) {
    if(value!.isEmpty)
       return 'field is requried';
   },
  style: TextStyle(color: Colors.black),
  obscureText: obscureTexty,
);
}

 void showSnakebarMethod(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Widget seatIcons(
    Color?seatColor,
    Function() onTap,
  ){

    return GestureDetector(
      onTap: onTap,
      child: Icon(
            Icons.chair,
            color: seatColor,
            size: 40,
          ),
    );


  }




