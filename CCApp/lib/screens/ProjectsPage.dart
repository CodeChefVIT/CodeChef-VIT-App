import 'package:CCApp/providers/reg.dart';
import 'package:CCApp/screens/homePage.dart';
import 'package:CCApp/screens/projectCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:CCApp/providers/projects.dart';
import 'package:provider/provider.dart';
import './projectsinputform.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

List projectDetails = [];

class _ProjectsPageState extends State<ProjectsPage> {
  bool _isLoading = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Project>(context, listen: false)
          .projectView(Provider.of<Reg>(context, listen: false).token);
      setState(() {
        projectDetails = Provider.of<Project>(context, listen: false).details;
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
                                margin: EdgeInsets.fromLTRB(30, 0, 0, 18),
                                height: 500,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24)),
                                  color: Color(0xFF34C759),
                                ),
                              ),
                              onTap: () async {},
                            ),
                          ],
                          secondaryActions: [
                            SlideAction(
                                child: Container(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              color: Colors.white,
                                              fontSize: 12),
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
                                onTap: () async {
                                  await Provider.of<Project>(context,
                                          listen: false)
                                      .deleteProject(
                                          Provider.of<Reg>(context,
                                                  listen: false)
                                              .token,
                                          projectDetails[index]['uuid']);
                                  setState(() {
                                    projectDetails.removeAt(index);
                                  });
                                }),
                          ],
                          child: ProjectCard(
                            name: projectDetails[index]['name'],
                            description: projectDetails[index]['description'],
                            mentor: projectDetails[index]['mentor'],
                            member1: projectDetails[index]['member1'] == null
                                ? ''
                                : projectDetails[index]['member1'],
                            member2: projectDetails[index]['member2'] == null
                                ? ''
                                : projectDetails[index]['member2'],
                            member3: projectDetails[index]['member3'] == null
                                ? ''
                                : projectDetails[index]['member3'],
                            member4: projectDetails[index]['member4'] == null
                                ? ''
                                : projectDetails[index]['member4'],
                            member5: projectDetails[index]['member5'] == null
                                ? ''
                                : projectDetails[index]['member5'],
                            member6: projectDetails[index]['member6'] == null
                                ? ''
                                : projectDetails[index]['member6'],
                            bgcolor: getColor(index),
                            sgcolor: getSGColor(index),
                          ),
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
