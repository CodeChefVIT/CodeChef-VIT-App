import 'package:flutter/material.dart';
import './meetingCard.dart';

void main(){
  runApp(HomePage());
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return HomePageState();
  }
}

final meetingDetails = const [
  {
    'name':'Meeting 1',
    'time':'7:15 PM',
    'venue':'SMV Tank',
    'date':'28th April 2020',
    'description':'Description 1',
    'members':'First and Second Years',
  },
  {
    'name':'Meeting 2',
    'time':'7:25 PM',
    'venue':'SMV Tank',
    'date':'22th April 2020',
    'description':'Description 2',
    'members':'Board',
  },
  {
    'name':'Meeting 3',
    'time':'5:25 PM',
    'venue':'SJT 323',
    'date':'22th April 2020',
    'description':'Description 3',
    'members':'Board',
  },
  {
    'name':'Meeting 4',
    'time':'3:25 PM',
    'venue':'SMV Tank',
    'date':'22th April 2020',
    'description':'Description 4',
    'members':'Board',
  },
];

class HomePageState extends State<HomePage>{
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height:42),
            Container(
              width: double.infinity,
              height: 54,
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/fulllogo.png'),
            ),
            SizedBox(height: 14,),
            Container(
              padding: EdgeInsets.only(left:30),
              alignment: Alignment.centerLeft,
              child: Text(
                'Meetings',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: meetingDetails.length,
                itemBuilder: (context,index){
                  return MeetingCard(
                    name: meetingDetails[index]['name'],
                    time: meetingDetails[index]['time'],
                    date: meetingDetails[index]['date'],
                    venue: meetingDetails[index]['venue'],
                    description: meetingDetails[index]['description'],
                    members: meetingDetails[index]['members'],
                    bgcolor: getColor(index),
                    sgcolor: getSGColor(index),
                  );
                }
              ),
            ),
          ],
        ),
      )
    );
  }
}

Color getColor(int selector) {
  if (selector % 3 == 0) {
    return Color(0xFF459AFF);
  } else if(selector % 3 == 1) {
    return Color(0xFFFF6745);
  }else if(selector % 3 ==2){
    return Color(0xFFFF4572);
  }
}

Color getSGColor(int selector) {
  if (selector % 3 == 0) {
    return Color(0xFF7BB7FF);
  } else if(selector % 3 == 1) {
    return Color(0xFFFF967E);
  }else if(selector % 3 ==2){
    return Color(0xFFFF6C90);
  }
}
