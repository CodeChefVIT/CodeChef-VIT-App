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
];

class HomePageState extends State<HomePage>{
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Color(0xFF459AFF),
              ),  
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text(
                'Meetings',
                style: TextStyle(
                  color: Color(0xFF459AFF),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
                color: Color(0xFFFF6745),
              ),
              title: Text(
                'Projects',
                style: TextStyle(
                  color: Color(0xFFFF6745),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info_outline,
                color: Color(0xFFFF4572),
              ),
              title: Text(
                'About Us',
                style: TextStyle(
                  color: Color(0xFFFF4572),
                ),
              ),
            ),
          ],
        ),
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
            ListView.builder(
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
            Container(
            margin: EdgeInsets.only(left:44, right: 44),
            height: 52,
            width: 259,
            child: FlatButton(
              onPressed: (){
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFF459AFF), Color(0xFFFF6745),Color(0xFFFF4572)]),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:15),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.center,
                        child: Text(
                          "Add Meeting",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ),
          )
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
