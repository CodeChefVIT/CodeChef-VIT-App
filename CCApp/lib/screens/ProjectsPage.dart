import 'package:CCApp/screens/homePage.dart';
import 'package:CCApp/screens/projectCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './projectsinputform.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

List projectDetails = [
  {
    'project': 'Codechef-VIT App',
    'mentor': 'Akshat Gupta',
    'member1': 'Siddharth Singh',
    'member2': '',
    'member3': 'Rishav Jain',
    'member4': '',
    'member5': 'new',
    'member6': ''
  },
  {
    'project': 'Codechef-VIT Ppp',
    'mentor': 'Akshat Gupta',
    'member1': 'Siddharth Singh',
    'member2': 'Okay',
    'member3': 'Rishav Jain',
    'member4': '',
    'member5': 'new',
    'member6': ''
  },
  {
    'project': 'Codechef-VIT App',
    'mentor': 'Akshat Gupta',
    'member1': 'Siddharth Singh',
    'member2': '',
    'member3': 'Rishav Jain',
    'member4': '',
    'member5': '',
    'member6': ''
  },
  {
    'project': 'Codechef-VIT App',
    'mentor': 'Akshat Gupta',
    'member1': 'Siddharth Singh',
    'member2': 'HBHBXH',
    'member3': 'Rishav Jain',
    'member4': 'asjknkan',
    'member5': 'new',
    'member6': 'askandk'
  },
  {
    'project': 'Codechef-VIT App',
    'mentor': 'Akshat Gupta',
    'member1': '',
    'member2': '',
    'member3': '',
    'member4': '',
    'member5': 'new',
    'member6': ''
  },
  {
    'project': 'Codechef-VIT App',
    'mentor': 'Akshat Gupta',
    'member1': '',
    'member2': '',
    'member3': '',
    'member4': '',
    'member5': '',
    'member6': ''
  },
];

class _ProjectsPageState extends State<ProjectsPage> {
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
              'Projects',
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
                itemCount: projectDetails.length,
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
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: Color(0xFF34C759),
                          ),
                        ),
                        onTap: () async {},
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
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
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
                            height: 500,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              color: Color(0xff7734eb),
                            ),
                          ),
                          onTap: () {}),
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
                            height: 500,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              color: Color(0xFFFF3B30),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              projectDetails.removeAt(index);
                            });
                          }),
                    ],
                    child: ProjectCard(
                      name: projectDetails[index]['project'],
                      mentor: projectDetails[index]['mentor'],
                      member1: projectDetails[index]['member1'],
                      member2: projectDetails[index]['member2'],
                      member3: projectDetails[index]['member3'],
                      member4: projectDetails[index]['member4'],
                      member5: projectDetails[index]['member5'],
                      member6: projectDetails[index]['member6'],
                      bgcolor: getColor(index),
                    ),
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
              onPressed: () {},
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
                            "Add Project",
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
