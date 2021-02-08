import 'dart:ui';
import 'package:CCApp/providers/meeting.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:CCApp/screens/editMeetings.dart';
import 'package:CCApp/screens/viewAttendance.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import './meetingCard.dart';
import './homePage.dart';
import './inputform.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geolocator/geolocator.dart';

class Meetings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MeetingsState();
  }
}

class MeetingsState extends State<Meetings> {
  @override
  void initState() {
    check = Provider.of<Reg>(context, listen: false).category;
    if (check == 5 || check == 3) {
      board = true;
    }
    getData();
    super.initState();
  }

  bool checkstart = false;
  int check;
  List meetingDetails = [];
  bool board = false;
  bool _isLoading = false;

  Future<void> getData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<MeetingData>(context, listen: false)
          .meetingView(Provider.of<Reg>(context, listen: false).token);
      setState(() {
        meetingDetails = Provider.of<MeetingData>(context, listen: false).details;
      });
      print(meetingDetails.length);
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> deleteMeet(uuid) async {
    try {
      await Provider.of<MeetingData>(context, listen: false)
          .meetingDelete(Provider.of<Reg>(context, listen: false).token, uuid);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : meetingDetails.length == 0
            ? Column(mainAxisSize: MainAxisSize.max, children: [
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
                SizedBox(
                  height: 14,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'You do not have any meetings!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                board
                    ? Container(
                        margin: EdgeInsets.only(left: 44, right: 44, bottom: 10, top: 10),
                        height: 52,
                        width: 260,
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
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 260 / 4,
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    ),
                                    Container(
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
                    : Container()
              ])
            : board
                ? Stack(children: [
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
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
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
                                      onTap: () async {
                                        checkstart = await Provider.of<MeetingData>(
                                                context,
                                                listen: false)
                                            .startAttendance(
                                                Provider.of<Reg>(context, listen: false)
                                                    .token,
                                                meetingDetails[index]['uuid']);
                                        meetingDetails[index]['start_time'] =
                                            Provider.of<MeetingData>(context,
                                                    listen: false)
                                                .meetingDetailsResp['start_time'];
                                        meetingDetails[index]['latitude'] =
                                            Provider.of<MeetingData>(context,
                                                    listen: false)
                                                .meetingDetailsResp['latitude'];
                                        meetingDetails[index]['longitude'] =
                                            Provider.of<MeetingData>(context,
                                                    listen: false)
                                                .meetingDetailsResp['longitude'];
                                        print(meetingDetails);
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(24)),
                                                  elevation: 12,
                                                  child: checkstart
                                                      ? Container(
                                                          padding: EdgeInsets.all(30),
                                                          child: Text(
                                                            'Attendance Started',
                                                            style: TextStyle(
                                                                fontSize: 24,
                                                                fontWeight:
                                                                    FontWeight.w600),
                                                          ),
                                                          height: 100,
                                                          width: double.infinity,
                                                        )
                                                      : Container(
                                                          padding: EdgeInsets.all(30),
                                                          child: Text(
                                                            'Error',
                                                            style: TextStyle(
                                                                fontSize: 24,
                                                                fontWeight:
                                                                    FontWeight.w600),
                                                          ),
                                                          height: 100,
                                                          width: double.infinity,
                                                        ));
                                            });
                                      },
                                    ),
                                    SlideAction(
                                      child: Container(
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
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
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (ctx) => ViewAttendance(
                                              uuid: meetingDetails[index]['uuid'],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                  secondaryActions: [
                                    SlideAction(
                                        child: Container(
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
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
                                                      color: Colors.white, fontSize: 12),
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
                                                      name: meetingDetails[index]['name'],
                                                      venue: meetingDetails[index]
                                                          ['venue'],
                                                      time: meetingDetails[index]['time'],
                                                      uuid: meetingDetails[index]['uuid'],
                                                      description: meetingDetails[index]
                                                          ['description'],
                                                      date: meetingDetails[index]['date'],
                                                      members: meetingDetails[index]
                                                          ['members'],
                                                    ));
                                              });
                                        }),
                                    SlideAction(
                                        child: Container(
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
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
                                                      color: Colors.white, fontSize: 12),
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
                                          deleteMeet(meetingDetails[index]['uuid']);
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
                          width: 260,
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
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 260 / 4,
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                      Container(
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
                  ])
                : // Non Board Members
                Stack(children: [
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
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.userCircle,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Mark",
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
                                      onTap: () async {
                                        Position position = await Geolocator()
                                            .getCurrentPosition(
                                                desiredAccuracy:
                                                    LocationAccuracy.bestForNavigation);
                                        double distanceInMeters = await Geolocator()
                                            .distanceBetween(
                                                double.parse(
                                                    meetingDetails[index]['latitude']),
                                                double.parse(
                                                    meetingDetails[index]['longitude']),
                                                position.latitude,
                                                position.longitude);
                                        print(distanceInMeters);
                                        if (distanceInMeters < 25) {
                                          await Provider.of<MeetingData>(context,
                                                  listen: false)
                                              .markAttendance(
                                            Provider.of<Reg>(context, listen: false)
                                                .token,
                                            meetingDetails[index]['uuid'],
                                          );
                                        }
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(24)),
                                                  elevation: 12,
                                                  child: distanceInMeters < 25
                                                      ? Container(
                                                          padding: EdgeInsets.all(30),
                                                          child: Text(
                                                            'Attendance Marked',
                                                            style: TextStyle(
                                                                fontSize: 24,
                                                                fontWeight:
                                                                    FontWeight.w600),
                                                          ),
                                                          height: 100,
                                                          width: double.infinity,
                                                        )
                                                      : Container(
                                                          padding: EdgeInsets.all(30),
                                                          child: Text(
                                                            'Get Closer',
                                                            style: TextStyle(
                                                                fontSize: 24,
                                                                fontWeight:
                                                                    FontWeight.w600),
                                                          ),
                                                          height: 100,
                                                          width: double.infinity,
                                                        ));
                                            });
                                      },
                                    ),
                                    SlideAction(
                                      child: Container(
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
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
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (ctx) => ViewAttendance(
                                              uuid: meetingDetails[index]['uuid'],
                                            ),
                                          ),
                                        );
                                      },
                                    )
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
                      ],
                    ),
                  ]);
  }
}
