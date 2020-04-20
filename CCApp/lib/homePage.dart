import 'package:CCApp/meetings.dart';
import 'package:flutter/material.dart';


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

  int _currentIndex=0;

  final tabs = [
    Meetings(),
    Center(child: Text('Projects'),),
    Center(child: Text('About Us'),),
  ];

  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex=index;
            });
          },
          items: [
            BottomNavigationBarItem( 
              icon: Icon(
                Icons.home,
                color: _currentIndex==0?Color(0xFF459AFF):Colors.grey,
              ),
              title: Text(
                'Meetings',
                style: TextStyle(
                  color: _currentIndex==0?Color(0xFF459AFF):Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
                color: _currentIndex==1?Color(0xFFFF6745):Colors.grey,
              ),
              title: Text(
                'Projects',
                style: TextStyle(
                  color: _currentIndex==1?Color(0xFFFF6745):Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info_outline,
                color: _currentIndex==2?Color(0xFFFF4572):Colors.grey,
              ),
              title: Text(
                'About Us',
                style: TextStyle(
                  color: _currentIndex==2?Color(0xFFFF4572):Colors.grey,
                ),
              ),
            ),
          ],
        ),
        body: tabs[_currentIndex]
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
