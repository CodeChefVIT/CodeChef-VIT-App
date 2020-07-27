import 'package:flutter/material.dart';

class MeetingCard extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          30, 0, 30, MediaQuery.of(context).size.height * 20 / 896),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: bgcolor,
      ),
      width: 350,
      height: MediaQuery.of(context).size.height * 170 / 896,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(34,
                    MediaQuery.of(context).size.height * 22 / 896 - 3, 0, 0),
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: MediaQuery.of(context).size.height * 18 / 896,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  child: SizedBox(
                width: 10,
              )),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(0,
                    MediaQuery.of(context).size.height * 22 / 896 - 3, 34, 0),
                child: Text(
                  time,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: MediaQuery.of(context).size.height * 18 / 896,
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
                padding: EdgeInsets.fromLTRB(34, 0, 0, 5),
                child: Text(
                  venue,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: MediaQuery.of(context).size.height * 18 / 896,
                  ),
                ),
              ),
              Expanded(
                  child: SizedBox(
                width: 10,
              )),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(0, 0, 34, 5),
                child: Text(
                  date,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: MediaQuery.of(context).size.height * 18 / 896,
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: sgcolor,
            ),
            margin: EdgeInsets.symmetric(horizontal: 34),
            height: MediaQuery.of(context).size.height * 54 / 896,
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 6 / 896,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(start: 34),
                child: Text(
                  members,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: MediaQuery.of(context).size.height * 16 / 896,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 18 / 896,
          ),
        ],
      ),
    );
  }
}
