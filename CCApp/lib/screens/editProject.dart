import 'package:CCApp/providers/memberdata.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homePage.dart';

class EditProject extends StatefulWidget {
  final String name;
  final String description;
  final String mentor;
  final String member1;
  final String member2;
  final String member3;
  final String member4;
  final String member5;
  final String member6;

  EditProject({
    @required this.name,
    @required this.mentor,
    this.member1,
    this.member2,
    this.member3,
    this.member4,
    this.member5,
    this.member6,
    @required this.description,
  });

  @override
  State<StatefulWidget> createState() {
    return EditProjectState();
  }
}

class EditProjectState extends State<EditProject> {
  Map<String, String> _data = {};
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      width: 400,
      height: 700,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(left: 7),
                child: Text(
                  'Edit Project',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5, right: 5),
                width: MediaQuery.of(context).size.height * 280 / 896,
                child: TextFormField(
                  initialValue: widget.name,
                  validator: (value) {
                    if (value == '') {
                      return 'This field is required.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    _data['name'] = value;
                  },
                  decoration: new InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: 'Project Name',
                    hintStyle: TextStyle(
                      color: Color(0xFFC7C7C7),
                      fontSize: 18,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5, right: 5),
                width: MediaQuery.of(context).size.height * 280 / 896,
                child: TextFormField(
                  initialValue: widget.description,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  validator: (value) {
                    if (value == '') {
                      return 'This field is required.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    _data['description'] = value;
                  },
                  decoration: new InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: 'Description',
                    hintStyle: TextStyle(
                      color: Color(0xFFC7C7C7),
                      fontSize: 18,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5, right: 5),
                width: MediaQuery.of(context).size.height * 280 / 896,
                child: TextFormField(
                  initialValue: widget.mentor,
                  validator: (value) {
                    if (value == '') {
                      return 'This field is required.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    _data['mentor'] = value;
                  },
                  decoration: new InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: 'Mentor',
                    hintStyle: TextStyle(
                      color: Color(0xFFC7C7C7),
                      fontSize: 18,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5, right: 5),
                width: MediaQuery.of(context).size.height * 280 / 896,
                child: TextFormField(
                  initialValue: widget.member1,
                  validator: (value) {
                    if (value == '') {
                      return 'This field is required.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    _data['member1'] = value;
                  },
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: 'Member 1',
                    hintStyle: TextStyle(
                      color: Color(0xFFC7C7C7),
                      fontSize: 18,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5, right: 5),
                width: MediaQuery.of(context).size.height * 280 / 896,
                child: TextFormField(
                  initialValue: widget.member2,
                  onChanged: (value) {
                    _data['member2'] = value;
                  },
                  decoration: new InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: 'Member 2',
                    hintStyle: TextStyle(
                      color: Color(0xFFC7C7C7),
                      fontSize: 18,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5, right: 5),
                width: MediaQuery.of(context).size.height * 280 / 896,
                child: TextFormField(
                  initialValue: widget.member3,
                  onChanged: (value) {
                    _data['member3'] = value;
                  },
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: 'Member 3',
                    hintStyle: TextStyle(
                      color: Color(0xFFC7C7C7),
                      fontSize: 18,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5, right: 5),
                width: MediaQuery.of(context).size.height * 280 / 896,
                child: TextFormField(
                  initialValue: widget.member4,
                  onChanged: (value) {
                    _data['member4'] = value;
                  },
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: 'Member 4',
                    hintStyle: TextStyle(
                      color: Color(0xFFC7C7C7),
                      fontSize: 18,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5, right: 5),
                width: MediaQuery.of(context).size.height * 280 / 896,
                child: TextFormField(
                  initialValue: widget.member5,
                  onChanged: (value) {
                    _data['member5'] = value;
                  },
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: 'Member 5',
                    hintStyle: TextStyle(
                      color: Color(0xFFC7C7C7),
                      fontSize: 18,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5, right: 5),
                width: MediaQuery.of(context).size.height * 280 / 896,
                child: TextFormField(
                  initialValue: widget.member6,
                  onChanged: (value) {
                    _data['member6'] = value;
                  },
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: 'Member 6',
                    hintStyle: TextStyle(
                      color: Color(0xFFC7C7C7),
                      fontSize: 18,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 20),
                height: 50,
                width: 300,
                child: FlatButton(
                  onPressed: () async {
                    print(_data);
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
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height *
                                      40 /
                                      896),
                              alignment: Alignment.center,
                              child: Text(
                                "Edit Project",
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
        ),
      ),
    );
  }
}
