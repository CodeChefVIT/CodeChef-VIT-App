import 'package:flutter/material.dart';

class MeetingCard extends StatelessWidget{
  final String name;
  final String time;
  final String venue;
  final String date;
  final String description;
  final String members;
  final Color bgcolor;
  final Color sgcolor;

  MeetingCard({
    @required this.name,
    @required this.time,
    @required this.venue,
    @required this.date,
    @required this.description,
    @required this.members,
    @required this.bgcolor,
    @required this.sgcolor,
  });

  List colors = [
    0xFF459AFF,
    0xFFFF6745,
    0xFFFF4572,
    0xFF7BB7FF,
    0xFFFF967E,
    0xFFFF6C90
  ];

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.fromLTRB(30,0,20,20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all( Radius.circular(24)),
        color: bgcolor,
      ),
      width: 350,
      height: 180,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(34,22,0,0),
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(child: SizedBox(width: 10,)),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(0,22,34,0),
                child: Text(
                  time,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(34,0,0,5),
                child: Text(
                  venue,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(child: SizedBox(width: 10,)),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(0,0,34,5),
                child: Text(
                  date,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all( Radius.circular(20)),
              color: sgcolor,
            ),
            margin: EdgeInsets.symmetric(horizontal: 34),
            height: 54,
            width: 294,
            padding: EdgeInsets.all(10),
            child: Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'SF Pro Text',
              ),
            ),
          ),
          SizedBox(height: 6,),
          Row(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(start: 34),
                child: Text(
                  members,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 18,),
        ],
      ),
    );
  }
}
