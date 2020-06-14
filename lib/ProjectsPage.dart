import 'package:flutter/material.dart';
import './projectsinputform.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}
List projectDetails=[
  {
    'project':'Codechef-VIT App',
    'mentor':'Akshat Gupta',
    'member1':'Siddharth Singh',
    'member2':'Dananjay Murugesh',
    'member3':'Rishav Jain',
  }
];
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
          SizedBox(width:15),
          Text(
            "Cancel",
            style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w600,
                fontSize: 19,
                fontFamily: 'SFProDisplay'
            ),
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
          SizedBox(width:15),
          Text(
            "Delete",
            style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w600,
                fontSize: 19,
                fontFamily: 'SFProDisplay'
            ),
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
    int j;

    List colors = [
      0xFF459AFF,
      0xFFFF6745,
      0xFFFF4572,
      0xFF7BB7FF,
      0xFFFF967E,
      0xFFFF6C90
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
            'assets/codechef-1.JPG', fit: BoxFit.contain, height: 50),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
            for(j=0;j<projectDetails.length;j++)
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(colors[j]),
                    ),
                    margin: EdgeInsets.all(12.0),
                    child: Dismissible(
                      onDismissed: (DismissDirection direction){
                        setState(() {
                          projectDetails.removeAt(j);
                        });
                      },
                      child: ExpansionTile(
                        title: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text(
                            projectDetails[j]['project'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        trailing: SizedBox(),
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
                                  projectDetails[j]['mentor'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 18
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.school,color: Colors.white),
                              ],
                            ),
                          ),
                        if(projectDetails[j]['member1']!=null)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 5),
                                  Text(
                                    projectDetails[j]['member1'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 18
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(),
                                ],
                              ),
                            ),
                          if(projectDetails[j]['member2']!=null)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 5),
                                  Text(
                                    projectDetails[j]['member2'],
                                    style:TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 18
                                  ) ,
                                ),
                                Spacer(),
                                SizedBox(),
                              ],
                            ),
                          ),
                          if(projectDetails[j]['member3']!=null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 5),
                                Text(
                                  projectDetails[j]['member3'],
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
                        backgroundColor: Color(colors[j]),
                      ),
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
                                          projectDetails.removeAt(j-1);
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
                    ),
                  ),
                ],
              ),
            SizedBox(height:12),
            Container(
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  showDialog(context: context,
                      builder: (context){
                        return Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                          elevation: 12,
                          child: ProjectsInputForm(),
                        );
                      }
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.blueAccent,
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent
                      ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
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
                              fontFamily: 'SFProDisplay'
                          ),
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
