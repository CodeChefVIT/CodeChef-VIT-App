import 'package:CCApp/screens/meetings.dart';
import 'package:CCApp/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:CCApp/screens/ProjectsPage.dart';
import 'members.dart';
import 'package:CCApp/screens/Expenses.dart';

void main() {
  runApp(HomePage(
    currentIndex: 0,
  ));
}

class HomePage extends StatefulWidget {
  int currentIndex;
  HomePage({@required this.currentIndex});
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final tabs = [
    Meetings(),
    ProjectsPage(),
    ProfilePage(),
    Expenses(),
    Members()
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget.currentIndex,
          onTap: (index) {
            setState(() {
              widget.currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.users,
                color:
                    widget.currentIndex == 0 ? Color(0xFF459AFF) : Colors.grey,
              ),
              title: Text(
                'Meetings',
                style: TextStyle(
                  color: widget.currentIndex == 0
                      ? Color(0xFF459AFF)
                      : Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.tasks,
                color:
                    widget.currentIndex == 1 ? Color(0xFFFF6745) : Colors.grey,
              ),
              title: Text(
                'Projects',
                style: TextStyle(
                  color: widget.currentIndex == 1
                      ? Color(0xFFFF6745)
                      : Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.userAlt,
                color:
                    widget.currentIndex == 2 ? Color(0xFF459AFF) : Colors.grey,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: widget.currentIndex == 3
                      ? Color(0xFF459AFF)
                      : Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.moneyBillWave,
                color:
                    widget.currentIndex == 3 ? Color(0xFFFF6745) : Colors.grey,
              ),
              title: Text(
                'Expenses',
                style: TextStyle(
                  color: widget.currentIndex == 4
                      ? Color(0xFFFF6745)
                      : Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.users,
                color:
                    widget.currentIndex == 4 ? Color(0xFFFF4572) : Colors.grey,
              ),
              title: Text(
                'Members',
                style: TextStyle(
                  color: widget.currentIndex == 5
                      ? Color(0xFFFF4572)
                      : Colors.grey,
                ),
              ),
            ),
          ],
        ),
        body: tabs[widget.currentIndex]);
  }
}

Color getColor(int selector) {
  if (selector % 3 == 0) {
    return Color(0xFF459AFF);
  } else if (selector % 3 == 1) {
    return Color(0xFFFF6745);
  } else if (selector % 3 == 2) {
    return Color(0xFFFF4572);
  } else
    return null;
}

Color getSGColor(int selector) {
  if (selector % 3 == 0) {
    return Color(0xFF7BB7FF);
  } else if (selector % 3 == 1) {
    return Color(0xFFFF967E);
  } else if (selector % 3 == 2) {
    return Color(0xFFFF6C90);
  } else
    return null;
}
