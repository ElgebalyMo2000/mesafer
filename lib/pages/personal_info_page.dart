import 'package:flutter/material.dart';
import 'package:mesafer/models/user_data_model.dart';
import 'package:mesafer/pages/payment_page.dart';
import 'package:mesafer/shared/components/components.dart';

class PersonalInfo extends StatefulWidget {
  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  String? firstName;

  String? lastName;

  String? birthDate;

  String? gender='select Gender';

  String? nationalId;

  String? phoneNumber;

  String? email;

  List<String> genderList = ['male' , 'female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Info',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Color.fromARGB(255, 235, 180, 117),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 235, 180, 117),
                Color.fromARGB(255, 241, 224, 206),
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Passenger 1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Zagazig',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                          color: Color.fromARGB(255, 235, 180, 117),
                        ),
                        Text(
                          'Cairo',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Coach:01',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Seat:007',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Text(
                      'First Name *',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    defaultFormField2(
                      type: TextInputType.name,
                      onchange: (p0) => firstName,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Last Name *',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    defaultFormField2(
                      type: TextInputType.name,
                      onchange: (p0) => lastName,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Date of Birth *',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    defaultFormField2(
                      type: TextInputType.datetime,
                      onchange: (p0) => birthDate,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Gender *',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                   /* defaultFormField2(
                      type: TextInputType.name,
                      onchange: (p0) => gender,
                    ),*/
                    //tttttttttttttt
                   PopupMenuButton(
                     initialValue: gender,
                       shape: RoundedRectangleBorder(
                       borderRadius:
                       BorderRadius.circular(16),
                     ),
                       onSelected: (nValue) {
                        setState(() {
                          gender = nValue.toString();
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
                               gender!,
                              ),
                             ],
                              ),
                             ),
                         itemBuilder: (context) =>
                            List.generate(
                           genderList.length,
                               (index) => PopupMenuItem(
                                value: genderList[index],
                               child: Text(
                                    genderList[index],
                                  ),
                                  ),
                                       ),
                   ),
                    //tttttttttttttt
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'National Id *',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    defaultFormField2(
                      type: TextInputType.number,
                      onchange: (p0) => nationalId,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Phone Number *',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    defaultFormField2(
                      type: TextInputType.phone,
                      onchange: (p0) => phoneNumber,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'E-Mail *',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    defaultFormField2(
                      type: TextInputType.emailAddress,
                      onchange: (p0) => email,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CheckBoxWidet(),
                  Text('I have read and accept the tems and conditions'),
                ],
              ),
              GestureDetector(
                onTap: () {
                  //Book function

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(),
                      ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .7,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 235, 180, 117),
                  ),
                  child: Center(
                    child: Text(
                      'Book',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CheckBoxWidet extends StatefulWidget {
  const CheckBoxWidet({super.key});

  @override
  State<CheckBoxWidet> createState() => _CheckBoxWidetState();
}

class _CheckBoxWidetState extends State<CheckBoxWidet> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.amber;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}


