import 'package:codechefvitapp/AboutUsPage.dart';
import 'package:codechefvitapp/MeetingsPage.dart';
import 'package:codechefvitapp/ProjectsPage.dart';
import 'package:flutter/material.dart';
import 'package:codechefvitapp/Expenses.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBottomNavigationBar(),
    );
  }
}
class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  int _currentIndex=0;
  final List<Widget> _children=[
    Meetings(),
    ProjectsPage(),
    Expenses(),
    AboutUsPage(),
  ];
  void onTapped(int index)
  {
    setState(() {
      _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon:Icon(
                Icons.home,
              color: _currentIndex==0?Colors.blueAccent:Colors.grey[500],
            ),
            title: Text(
                'Meetings',
              style: TextStyle(
                color: _currentIndex==0?Colors.blueAccent:Colors.grey[500],
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon:Icon(
                Icons.book,
              color: _currentIndex==1?Colors.deepOrangeAccent:Colors.grey[500],
            ),
            title: Text(
                'Projects',
              style: TextStyle(
                color: _currentIndex==1?Colors.deepOrangeAccent:Colors.grey[500],
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.attach_money,
              color: _currentIndex==2?Colors.green:Colors.grey[500],
            ),
            title: Text(
              'Expenses',
              style: TextStyle(
                color: _currentIndex==2?Colors.green:Colors.grey[500],
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon:Icon(
                Icons.info_outline,
              color: _currentIndex==3?Colors.pinkAccent:Colors.grey[500],
            ),
            title: Text(
                'About Us',
              style: TextStyle(
                color: _currentIndex==3?Colors.pinkAccent:Colors.grey[500],
              ),
            ),
          ),
        ],
      ),

    );
  }
}

