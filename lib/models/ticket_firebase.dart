



import 'package:cloud_firestore/cloud_firestore.dart';

class TicketFirebase{
  String cairo = 'Cairo';
  String zag = 'Zagazig';
  String alx = 'Alexandria';
  String aswan = 'Aswan';
  String asuit = 'Asuit';
  String menia = 'Menia';
  String mansora = 'Mansora';
  String banha = 'Banha';
  String tanta = 'Tanta';
  //List tripName = ['Cairo To Aswan','Cairo to Zagazig','Cairo to Mansoura','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];
  List arivalTime = [{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},{'7 BM','11 BM','3:30 AM'},];
  List startTime=[{'7 AM','11 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},{'7 AM','12 AM','3:30 BM'},];
  List source = [''];
  List destination = ['Aswan','Asuit','Menia','Zagazig','Mansora','Banha','Tanta','Cairo','Mansoura','Tanta','Cairo','Aswan','Tanta','Cairo','Asuit','Alexandria','Menia','Zagazig'];
  List date = ['','','','','','','','','','','','','','','','','',''];
  bool seatChosen = false;
  List<Map<dynamic,dynamic>>? seats;

  var price = [{75,30},{75,30},{75,30},{75,30},{75,30},{75,30},{75,30},{75,30},{75,30},{75,30},{75,30},{75,30},{75,30},{75,30},{75,30},{75,30},{75,30},{75,30},];
 
 void fillSeatData(){
  int seatNum = 1;
  Map seatItem = {
    'seat number':seatNum,
    'seat state':seatChosen,
  };
for(int i = 1 ; i<=32 ;i++){
   seats!.add(seatItem);

}
 }


void addSource(){
  
  for(int i = 0 ; i<6 ; i++){
    source.add(cairo);
  }
  for(int i = 0 ; i<2 ; i++){
    source.add(zag);
  }
  for(int i = 0 ; i<2 ; i++){
    source.add(alx);
  }
  for(int i = 0 ; i<4 ; i++){
    source.add(aswan);
  }
}



Future<void> initializeTripsDatabase()async{
  addSource();
  fillSeatData();

Future<void> _createUserCollection(String uid) async {
  for(int i = 0 ; i<source.length ; i++){
    await FirebaseFirestore.instance.collection('trips').doc(uid).set({
     'arivalTime' :arivalTime[i],
       'startTime':startTime[i],
       'source':source[i],
       'destination':destination[i],
       'date':date[i],
       'seats':seats![i],
       'price':price[i],
       'id' :uid,
    });

  }
  }

}

}