import 'package:flutter/material.dart';

class AttendanceCard extends StatelessWidget {
  final String name;
  final String regno;
  final Color color;
  final bool status;

  AttendanceCard(
      {@required this.name,
      @required this.regno,
      @required this.color,
      @required this.status});

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
      height: MediaQuery.of(context).size.height * 70 / 896,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(34,
                    MediaQuery.of(context).size.height * 11 / 896 - 3, 0, 0),
                child: Text(
                  name,
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
            ],
          ),
          Expanded(
            child: Container(
              width: 10,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 34),
            child: Text(
              status ? 'P' : 'A',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'SF Pro Display',
                fontSize: MediaQuery.of(context).size.height * 28 / 896,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
