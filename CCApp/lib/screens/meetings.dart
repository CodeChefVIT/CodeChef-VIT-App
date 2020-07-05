import 'dart:ui';
import 'package:CCApp/providers/meeting.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:CCApp/screens/editMeeetings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
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
  void initState() {
    print(Provider.of<Reg>(context, listen: false).category);
    getData();
    super.initState();
  }

  List meetingDetails = [];
  bool _isLoading = false;

  Future<void> getData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<MeetingData>(context, listen: false)
          .meetingView(Provider.of<Reg>(context, listen: false).token);
      setState(() {
        meetingDetails =
            Provider.of<MeetingData>(context, listen: false).details;
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Stack(children: [
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
                          actionPane: SlidableScrollActionPane(),
                          actionExtentRatio: 0.3,
                          actions: [
                            SlideAction(
                              child: Container(
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 70,
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.userCircle,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Record",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                                margin: EdgeInsets.fromLTRB(30, 0, 0, 18),
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24)),
                                  color: Color(0xFF34C759),
                                ),
                              ),
                              onTap: () {},
                            ),
                            SlideAction(
                              child: Container(
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 70,
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.eye,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Attendance",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                                margin: EdgeInsets.fromLTRB(15, 0, 15, 18),
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24)),
                                  color: Color.fromRGBO(0, 86, 255, 100),
                                ),
                              ),
                              onTap: () {},
                            )
                          ],
                          secondaryActions: [
                            SlideAction(
                                child: Container(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 70,
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.pencilAlt,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Edit",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                  margin: EdgeInsets.fromLTRB(0, 0, 30, 18),
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24)),
                                    color: Color(0xff7734eb),
                                  ),
                                ),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24)),
                                            elevation: 12,
                                            child: EditMeeting(
                                              name: meetingDetails[index]
                                                  ['name'],
                                              venue: meetingDetails[index]
                                                  ['venue'],
                                              time: meetingDetails[index]
                                                  ['time'],
                                              uuid: meetingDetails[index]
                                                  ['uuid'],
                                              description: meetingDetails[index]
                                                  ['description'],
                                              date: meetingDetails[index]
                                                  ['date'],
                                              members: meetingDetails[index]
                                                  ['members'],
                                            ));
                                      });
                                }),
                            SlideAction(
                                child: Container(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 70,
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.times,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Delete",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                  margin: EdgeInsets.fromLTRB(0, 0, 30, 18),
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24)),
                                    color: Color(0xFFFF3B30),
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
                  margin:
                      EdgeInsets.only(left: 44, right: 44, bottom: 10, top: 10),
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
