import 'package:CCApp/providers/profile.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:CCApp/screens/editProfile.dart';
import 'package:CCApp/screens/setupprofile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  List<dynamic> prof = [];
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
      await Provider.of<Profile>(context, listen: false)
          .profileView(Provider.of<Reg>(context, listen: false).token);
      setState(() {
        prof = Provider.of<Profile>(context, listen: false).details;
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
    return Scaffold(
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : prof.toString() == '[]'
                ? SetupProfile()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 30 / 414,
                                MediaQuery.of(context).size.height * 70 / 896,
                                0,
                                0),
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                  fontSize: 34, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 12,
                              height: 1,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height *
                                    75 /
                                    896),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (ctx) => EditProfile(),
                                  ),
                                );
                              },
                              child: Text(
                                'Edit',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 30 / 896,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 30 / 414,
                          ),
                          FaIcon(
                            FontAwesomeIcons.userCircle,
                            size: 28,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 10 / 414,
                                0,
                                0,
                                0),
                            child: Text(
                              prof[0]['name'],
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 25 / 896,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    30 /
                                    414,
                              ),
                              FaIcon(
                                FontAwesomeIcons.phone,
                                size: 20,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width *
                                        10 /
                                        414,
                                    0,
                                    0,
                                    0),
                                child: Text(
                                  prof[0]['phone'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              width: 12,
                              height: 1,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    30 /
                                    414,
                              ),
                              FaIcon(
                                prof[0]['gender'] == 'FEM'
                                    ? FontAwesomeIcons.venus
                                    : FontAwesomeIcons.mars,
                                size: 20,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width * 10 / 414,
                                  0,
                                  MediaQuery.of(context).size.width * 30 / 414,
                                  0,
                                ),
                                child: Text(
                                  prof[0]['gender'] == 'FEM'
                                      ? 'Female'
                                      : 'Male',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 10 / 896,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 30 / 414,
                          ),
                          FaIcon(
                            FontAwesomeIcons.envelope,
                            size: 20,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 10 / 414,
                                0,
                                0,
                                0),
                            child: Text(
                              prof[0]['email'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 10 / 896,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    30 /
                                    414,
                              ),
                              FaIcon(
                                FontAwesomeIcons.graduationCap,
                                size: 20,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width *
                                        10 /
                                        414,
                                    0,
                                    0,
                                    0),
                                child: Text(
                                  prof[0]['regno'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              width: 12,
                              height: 1,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    30 /
                                    414,
                              ),
                              FaIcon(
                                FontAwesomeIcons.building,
                                size: 20,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width *
                                        10 /
                                        414,
                                    0,
                                    0,
                                    0),
                                child: Text(
                                  prof[0]['block'] + ' : ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        30 /
                                        414),
                                child: Text(
                                  prof[0]['room'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 390 / 896,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 44, right: 44),
                        height: MediaQuery.of(context).size.height * 56 / 896,
                        width: 326,
                        child: FlatButton(
                          onPressed: () async {
                            await Provider.of<Reg>(context, listen: false)
                                .logout();
                            RestartWidget.restartApp(context);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(33),
                          ),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFF3BE0EB),
                                Color(0xFF1D59A1)
                              ]),
                              borderRadius: BorderRadius.circular(33),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Log Out",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ));
  }
}
