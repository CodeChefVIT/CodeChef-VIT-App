import 'package:flutter/material.dart';

class MemberDetails extends StatelessWidget {
  final String name;
  final String regno;
  final int category;
  final Color color;

  MemberDetails(
      {@required this.name,
      @required this.regno,
      @required this.category,
      @required this.color});

  String getCategory(String value) {
    if (value == '1') {
      return 'Fresher';
    }
    if (value == '2') {
      return 'Senior';
    }
    if (value == '3') {
      return 'Board';
    }
    if (value == '4') {
      return 'Ex Member';
    }
    if (value == '5') {
      return 'President';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          30, 0, 30, MediaQuery.of(context).size.height * 20 / 896),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: color,
      ),
      width: 350,
      height: MediaQuery.of(context).size.height * 80 / 896,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(
                34, MediaQuery.of(context).size.height * 11 / 896 - 3, 0, 0),
            child: Text(
              name == "Profile does not exist" ? "Profile Incomplete" : name,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'SF Pro Display',
                fontSize: MediaQuery.of(context).size.height * 23 / 896,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(34, 0, 0, 0),
            child: Text(
              regno,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'SF Pro Display',
                fontSize: MediaQuery.of(context).size.height * 18 / 896,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(34, 0, 0, 0),
            child: Text(
              getCategory(category.toString()),
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'SF Pro Display',
                fontSize: MediaQuery.of(context).size.height * 18 / 896,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
