import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './meetingCard.dart';
import './homePage.dart';
import './inputform.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Meetings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MeetingsState();
  }
}

class MeetingsState extends State<Meetings> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 42),
          Container(
            width: double.infinity,
            height: 54,
            alignment: Alignment.topCenter,
            child: Image.asset('assets/images/fulllogo.png'),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
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
            child: Container(
              margin: EdgeInsets.only(top: 5),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 600 / 896 - 50,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: meetingDetails.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.30,
                    secondaryActions: [
                      SlideAction(
                          child: Container(
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.trashAlt,
                                color: Colors.white,
                              ),
                            ),
                            margin: EdgeInsets.fromLTRB(0, 0, 30, 18),
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              color: Colors.red,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              meetingDetails.removeAt(index);
                            });
                          }),
                    ],
                    child: Container(
                        child: MeetingCard(
                      name: meetingDetails[index]['name'],
                      time: meetingDetails[index]['time'],
                      date: meetingDetails[index]['date'],
                      venue: meetingDetails[index]['venue'],
                      description: meetingDetails[index]['description'],
                      members: meetingDetails[index]['members'],
                      bgcolor: getColor(index),
                      sgcolor: getSGColor(index),
                    )),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 44, right: 44, bottom: 10, top: 10),
            height: 52,
            width: 259,
            child: FlatButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        elevation: 12,
                        child: InputForm(),
                      );
                    });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFF459AFF),
                    Color(0xFFFF6745),
                    Color(0xFFFF4572)
                  ]),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
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
                    )),
              ),
            ),
          )
        ],
      ),
    ]);
  }
}
