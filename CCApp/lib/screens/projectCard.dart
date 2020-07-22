import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectCard extends StatelessWidget {
  final String name;
  final String mentor;
  final String member1;
  final String member2;
  final String member3;
  final String member4;
  final String member5;
  final String member6;
  final Color bgcolor;

  ProjectCard({
    @required this.name,
    @required this.mentor,
    this.member1,
    this.member2,
    this.member3,
    this.member4,
    this.member5,
    this.member6,
    @required this.bgcolor,
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
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          30, 0, 30, MediaQuery.of(context).size.height * 20 / 896),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: bgcolor,
      ),
      width: 350,
      height: MediaQuery.of(context).size.height * 300 / 896,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(
                34, MediaQuery.of(context).size.height * 22 / 896 - 3, 0, 0),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'SF Pro Display',
                fontSize: MediaQuery.of(context).size.height * 24 / 896,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(34,
                    MediaQuery.of(context).size.height * 10 / 896 - 3, 0, 0),
                child: Text(
                  mentor,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: MediaQuery.of(context).size.height * 18 / 896,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                width: 5,
              )),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(0,
                    MediaQuery.of(context).size.height * 10 / 896 - 3, 34, 0),
                child: FaIcon(FontAwesomeIcons.graduationCap,
                    color: Colors.white, size: 20),
              )
            ],
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(34, 0, 0, 5),
                child: Text(
                  member1,
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
                  member2,
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
            ),
            margin: EdgeInsets.symmetric(horizontal: 34),
            height: MediaQuery.of(context).size.height * 54 / 896,
            width: 294,
            padding: EdgeInsets.all(10),
            child: Text(
              member3,
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
                  member4,
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 34),
            height: MediaQuery.of(context).size.height * 54 / 896,
            width: 294,
            padding: EdgeInsets.all(10),
            child: Text(
              member5,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'SF Pro Text',
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 34),
            height: MediaQuery.of(context).size.height * 54 / 896,
            width: 294,
            padding: EdgeInsets.all(10),
            child: Text(
              member6,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'SF Pro Text',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
