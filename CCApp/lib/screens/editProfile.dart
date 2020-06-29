import 'dart:convert';

import 'package:CCApp/providers/profile.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:CCApp/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditProfileState();
  }
}

class EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    details = Provider.of<Profile>(context, listen: false).details;
    super.initState();
  }

  @override
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _data = {};
  List<dynamic> details;
  Future<void> _submit() async {
    try {
      await Provider.of<Profile>(context, listen: false).profileEdit(_data,
          Provider.of<Reg>(context, listen: false).token, details[0]['uuid']);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => HomePage(),
        ),
      );
    } catch (error) {
      print(error);
      await showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Error'),
          content: Text('Profile Edit Failed'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 100 / 896),
            Container(
              height: MediaQuery.of(context).size.height * 89 / 896,
              width: double.infinity,
              child: Image.asset('assets/images/fulllogo.png'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 34 / 896,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 29 / 414),
              child: Text(
                "Edit your Profile",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Display'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 20 / 896,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 44, right: 44),
              width: 326,
              child: TextFormField(
                initialValue: details[0]['name'],
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
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(
                    Icons.assignment_ind,
                    color: Color(0xFF1D59A1),
                  ),
                  hintText: 'Name',
                  hintStyle: TextStyle(
                    color: Color(0xFFC7C7C7),
                    fontSize: 18,
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(27.5)),
                    borderSide: BorderSide(
                      color: Color(0xFF1D59A1),
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
              height: MediaQuery.of(context).size.height * 20 / 896,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 44, right: 44),
              width: 326,
              child: TextFormField(
                initialValue: details[0]['regno'],
                validator: (value) {
                  if (value == '') {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  _data['regno'] = value;
                },
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(
                    Icons.assignment_ind,
                    color: Color(0xFF1D59A1),
                  ),
                  hintText: 'Registeration Number',
                  hintStyle: TextStyle(
                    color: Color(0xFFC7C7C7),
                    fontSize: 18,
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(27.5)),
                    borderSide: BorderSide(
                      color: Color(0xFF1D59A1),
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
              height: MediaQuery.of(context).size.height * 20 / 896,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 44, right: 44),
              width: 326,
              child: TextFormField(
                initialValue: details[0]['phone'],
                validator: (value) {
                  if (value == '') {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  _data['phone'] = value;
                },
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(
                    Icons.assignment_ind,
                    color: Color(0xFF1D59A1),
                  ),
                  hintText: 'Phone',
                  hintStyle: TextStyle(
                    color: Color(0xFFC7C7C7),
                    fontSize: 18,
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(27.5)),
                    borderSide: BorderSide(
                      color: Color(0xFF1D59A1),
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
              height: MediaQuery.of(context).size.height * 20 / 896,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 44, right: 44),
              width: 326,
              child: TextFormField(
                initialValue: details[0]['room'],
                validator: (value) {
                  if (value == '') {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  _data['room'] = value;
                },
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(
                    Icons.assignment_ind,
                    color: Color(0xFF1D59A1),
                  ),
                  hintText: 'Room',
                  hintStyle: TextStyle(
                    color: Color(0xFFC7C7C7),
                    fontSize: 18,
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(27.5)),
                    borderSide: BorderSide(
                      color: Color(0xFF1D59A1),
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
              height: MediaQuery.of(context).size.height * 20 / 896,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 44, right: 44),
              width: 326,
              child: TextFormField(
                initialValue: details[0]['block'],
                validator: (value) {
                  if (value == '') {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  _data['block'] = value;
                },
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(
                    Icons.assignment_ind,
                    color: Color(0xFF1D59A1),
                  ),
                  hintText: 'Block',
                  hintStyle: TextStyle(
                    color: Color(0xFFC7C7C7),
                    fontSize: 18,
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(27.5)),
                    borderSide: BorderSide(
                      color: Color(0xFF1D59A1),
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
              height: MediaQuery.of(context).size.height * 20 / 896,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 44, right: 44),
              width: 326,
              child: TextFormField(
                initialValue: details[0]['gender'],
                validator: (value) {
                  if (value == '') {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  _data['gender'] = value;
                },
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(
                    Icons.assignment_ind,
                    color: Color(0xFF1D59A1),
                  ),
                  hintText: 'Gender',
                  hintStyle: TextStyle(
                    color: Color(0xFFC7C7C7),
                    fontSize: 18,
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(27.5)),
                    borderSide: BorderSide(
                      color: Color(0xFF1D59A1),
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
              height: MediaQuery.of(context).size.height * 20 / 896,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 44, right: 44),
              width: 326,
              child: TextFormField(
                initialValue: details[0]['email'],
                validator: (value) {
                  if (value == '') {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  _data['email'] = value;
                },
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(
                    Icons.assignment_ind,
                    color: Color(0xFF1D59A1),
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Color(0xFFC7C7C7),
                    fontSize: 18,
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(27.5)),
                    borderSide: BorderSide(
                      color: Color(0xFF1D59A1),
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
              height: MediaQuery.of(context).size.height * 20 / 896,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 27 / 896,
            ),
            Container(
              margin: EdgeInsets.only(left: 44, right: 44),
              height: MediaQuery.of(context).size.height * 56 / 896,
              width: 326,
              child: FlatButton(
                onPressed: () {
                  _submit();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(33),
                ),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF3BE0EB), Color(0xFF1D59A1)]),
                    borderRadius: BorderRadius.circular(33),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Save Changes",
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
        ),
      ),
    )));
  }
}
