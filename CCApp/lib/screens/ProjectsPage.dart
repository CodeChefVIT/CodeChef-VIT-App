import 'package:flutter/material.dart';
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
    'member2': 'Dananjay Murugesh',
    'member3': 'Rishav Jain',
  }
];
List _expand = List.generate(20, (i) => false).toList();
Widget slideRightBackground() {
  return Container(
    color: Colors.white,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.cancel,
            color: Colors.black,
          ),
          SizedBox(width: 15),
          Text(
            "Cancel",
            style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w600,
                fontSize: 19,
                fontFamily: 'SFProDisplay'),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    ),
  );
}

Widget slideLeftBackground() {
  return Container(
    color: Colors.white,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.black,
          ),
          SizedBox(width: 15),
          Text(
            "Delete",
            style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w600,
                fontSize: 19,
                fontFamily: 'SFProDisplay'),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    List colors = [
      0xFF459AFF,
      0xFFFF6745,
      0xFFFF4572,
      0xFF7BB7FF,
      0xFFFF967E,
      0xFFFF6C90
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 42),
            Container(
              width: double.infinity,
              height: 54,
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/fulllogo.png'),
            ),
            SizedBox(height: 14),
            Container(
              padding: EdgeInsets.only(left: 30),
              alignment: Alignment.centerLeft,
              child: Text(
                'Projects',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  fontFamily: 'SFProDisplay',
                ),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: projectDetails.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (DismissDirection direction) {
                      setState(() {
                        projectDetails.removeAt(index);
                      });
                    },
                    background: slideRightBackground(),
                    secondaryBackground: slideLeftBackground(),
                    key: UniqueKey(),
                    // ignore: missing_return
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.endToStart) {
                        final bool res = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                    "Are you sure you want to delete this project?"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        projectDetails.removeAt(index);
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                        return res;
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: _expand[index] ? 250.0 : 50.0,
                      width: 400,
                      margin: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: index % 3 == 0
                              ? Colors.deepOrangeAccent
                              : (index % 3 == 1
                                  ? Colors.blueAccent
                                  : Colors.pinkAccent)),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 18),
                                child: Text(
                                  projectDetails[index]['project'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              IconButton(
                                icon: Icon(_expand[index]
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down),
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    _expand[index] = !_expand[index];
                                  });
                                },
                              ),
                            ],
                          ),
                          if (_expand[index])
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Team Members:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(width: 5),
                                      Text(
                                        projectDetails[index]['mentor'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 18),
                                      ),
                                      Spacer(),
                                      Icon(Icons.school, color: Colors.white),
                                    ],
                                  ),
                                ),
                                if (projectDetails[index]['member1'] != null)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 5),
                                        Text(
                                          projectDetails[index]['member1'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        Spacer(),
                                        SizedBox(),
                                      ],
                                    ),
                                  ),
                                if (projectDetails[index]['member2'] != null)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 5),
                                        Text(
                                          projectDetails[index]['member2'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        Spacer(),
                                        SizedBox(),
                                      ],
                                    ),
                                  ),
                                if (projectDetails[index]['member3'] != null)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 5),
                                        Text(
                                          projectDetails[index]['member3'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Spacer(),
                                        SizedBox(),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                }),
            SizedBox(height: 12),
            Container(
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          elevation: 12,
                          child: ProjectsInputForm(),
                        );
                      });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blueAccent,
                          Colors.deepOrangeAccent,
                          Colors.pinkAccent
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20),
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                        ),
                        SizedBox(width: 50),
                        Text(
                          "Add Projects",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontFamily: 'SFProDisplay'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
