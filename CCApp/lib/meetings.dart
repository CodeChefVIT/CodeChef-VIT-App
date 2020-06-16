import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './meetingCard.dart';
import './homePage.dart';
import './inputform.dart';

class Meetings extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return MeetingsState();
  }
}



class MeetingsState extends State<Meetings>{
  @override
  
  Widget build(BuildContext context){
    return Stack(
          children:[ 
            Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height:42),
              Container(
                width: double.infinity,
                height: 54,
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/fulllogo.png'),
              ),
              SizedBox(height: 14,),
              Container(
                padding: EdgeInsets.only(left:30),
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
                  margin: EdgeInsets.only(top:5),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 600 / 896 -50,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: meetingDetails.length,
                      itemBuilder: (context,index){
                        final meeting=meetingDetails[index];
                        return Dismissible(
                          confirmDismiss: (DismissDirection direction) async {
                            return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Confirm"),
                                  content: const Text("Are you sure you wish to delete this item?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () => Navigator.of(context).pop(true),
                                      child: const Text("DELETE")
                                    ),
                                    FlatButton(
                                      onPressed: () => Navigator.of(context).pop(false),
                                      child: const Text("CANCEL"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          background: Container(
                            margin: EdgeInsets.fromLTRB(30,0,30,MediaQuery.of(context).size.height * 20 / 896),
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(24)),
                            color: Colors.red,
                          ),
                            child: Center(child: FaIcon(FontAwesomeIcons.trashAlt,color: Colors.white,),),
                          ),
                          key: Key(meeting['name']),
                          onDismissed: (left){
                            setState(() {
                              meetingDetails.removeAt(index);
                              print(meetingDetails);
                            });
                            },
                            child: MeetingCard(
                            name: meetingDetails[index]['name'],
                            time: meetingDetails[index]['time'],
                            date: meetingDetails[index]['date'],
                            venue: meetingDetails[index]['venue'],
                            description: meetingDetails[index]['description'],
                            members: meetingDetails[index]['members'],
                            bgcolor: getColor(index),
                            sgcolor: getSGColor(index),
                          ),
                        );
                      }
                  ),
                ),
              ),
              Container(
              margin: EdgeInsets.only(left:44, right: 44, bottom:10, top: 10),
              height: 52,
              width: 259,
              child: FlatButton(
                onPressed: (){
                  showDialog(context: context,
                  builder: (context){
                    return Dialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      elevation: 12,
                      child: InputForm(),
                    );
                  }
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xFF459AFF), Color(0xFFFF6745),Color(0xFFFF4572)]),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left:15),
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
                    )
                  ),
                ),
              ),
            )
            ],
          ),
          ]
    );
}}