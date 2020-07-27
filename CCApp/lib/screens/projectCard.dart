import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectCard extends StatefulWidget {
  final String name;
  final String description;
  final String mentor;
  final String member1;
  final String member2;
  final String member3;
  final String member4;
  final String member5;
  final String member6;
  final Color bgcolor;
  final Color sgcolor;

  ProjectCard(
      {@required this.name,
      @required this.mentor,
      this.member1,
      this.member2,
      this.member3,
      this.member4,
      this.member5,
      this.member6,
      @required this.description,
      @required this.bgcolor,
      @required this.sgcolor});
  @override
  State<StatefulWidget> createState() {
    return ProjectCardState();
  }
}

class ProjectCardState extends State<ProjectCard> {
  int height = 0;

  @override
  void initState() {
    if (widget.member1 != '') {
      height++;
    }
    if (widget.member2 != '') {
      height++;
    }
    if (widget.member3 != '') {
      height++;
    }
    if (widget.member4 != '') {
      height++;
    }
    if (widget.member5 != '') {
      height++;
    }
    if (widget.member6 != '') {
      height++;
    }
    print(height);
    super.initState();
  }

  bool isPressed = false;

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
    return AnimatedContainer(
      curve: Curves.bounceOut,
      duration: Duration(milliseconds: 700),
      margin: EdgeInsets.fromLTRB(
          30, 0, 30, MediaQuery.of(context).size.height * 20 / 896),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: widget.bgcolor,
      ),
      width: 350,
      height: isPressed
          ? MediaQuery.of(context).size.height * 140 / 896 + height * 25 + 30
          : 85,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(34,
                    MediaQuery.of(context).size.height * 22 / 896 - 3, 0, 0),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: MediaQuery.of(context).size.height * 20 / 896,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 2,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(0,
                    MediaQuery.of(context).size.height * 22 / 896 - 3, 25, 0),
                child: IconButton(
                  icon: FaIcon(
                    isPressed
                        ? FontAwesomeIcons.arrowUp
                        : FontAwesomeIcons.arrowDown,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isPressed = !isPressed;
                      print(isPressed);
                    });
                  },
                ),
              )
            ],
          ),
          isPressed
              ? Flexible(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: widget.sgcolor,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 44),
                        height: MediaQuery.of(context).size.height * 54 / 896,
                        width: 294,
                        padding: EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          child: Text(
                            widget.description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'SF Pro Text',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(
                                34,
                                MediaQuery.of(context).size.height * 1 / 896,
                                0,
                                0),
                            child: Container(
                              child: Text(
                                widget.mentor,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SF Pro Display',
                                  fontSize: MediaQuery.of(context).size.height *
                                      18 /
                                      896,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 5,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.fromLTRB(
                                0,
                                MediaQuery.of(context).size.height * 10 / 896 -
                                    3,
                                34,
                                0),
                            child: FaIcon(FontAwesomeIcons.graduationCap,
                                color: Colors.white, size: 20),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                    widget.member1 != ''
                        ? Flexible(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(34, 0, 0, 3),
                              child: Text(
                                widget.member1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SF Pro Display',
                                  fontSize: MediaQuery.of(context).size.height *
                                      18 /
                                      896,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: 0,
                            height: 0,
                          ),
                    widget.member2 != ''
                        ? Flexible(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(34, 0, 0, 3),
                              child: Text(
                                widget.member2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SF Pro Display',
                                  fontSize: MediaQuery.of(context).size.height *
                                      18 /
                                      896,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: 0,
                            height: 0,
                          ),
                    widget.member3 != ''
                        ? Flexible(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(34, 0, 0, 3),
                              child: Text(
                                widget.member3,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SF Pro Display',
                                  fontSize: MediaQuery.of(context).size.height *
                                      18 /
                                      896,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: 0,
                            height: 0,
                          ),
                    widget.member4 != ''
                        ? Flexible(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(34, 0, 0, 3),
                              child: Text(
                                widget.member4,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SF Pro Display',
                                  fontSize: MediaQuery.of(context).size.height *
                                      18 /
                                      896,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: 0,
                            height: 0,
                          ),
                    widget.member5 != ''
                        ? Flexible(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(34, 0, 0, 3),
                              child: Text(
                                widget.member5,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SF Pro Display',
                                  fontSize: MediaQuery.of(context).size.height *
                                      18 /
                                      896,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: 0,
                            height: 0,
                          ),
                    widget.member6 != ''
                        ? Flexible(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(34, 0, 0, 3),
                              child: Text(
                                widget.member6,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SF Pro Display',
                                  fontSize: MediaQuery.of(context).size.height *
                                      18 /
                                      896,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: 0,
                            height: 0,
                          ),
                  ]),
                )
              : Container(
                  height: 0,
                  width: 0,
                )
        ],
      ),
    );
  }
}
