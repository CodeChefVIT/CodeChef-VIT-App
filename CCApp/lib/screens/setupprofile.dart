import 'package:CCApp/providers/profile.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homePage.dart';

class SetupProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SetupProfileState();
  }
}

class SetupProfileState extends State<SetupProfile> {
  @override
  void initState() {
    details = Provider.of<Reg>(context, listen: false).userDetails;
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _data = {};
  Map details;
  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    try {
      await Provider.of<Profile>(context, listen: false)
          .profileSetup(_data, Provider.of<Reg>(context, listen: false).token);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => HomePage(
            currentIndex: 4,
          ),
        ),
      );
    } catch (error) {
      await showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Error'),
          content: Text('Profile Setup Failed'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return SingleChildScrollView(
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
                "Finish your Profile...",
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
                initialValue: details['name'],
                validator: (value) {
                  if (value == '') {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
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
                initialValue: details['regno'],
                validator: (value) {
                  if (value == '') {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
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
                validator: (value) {
                  if (value == '') {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
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
                validator: (value) {
                  if (value == '') {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
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
                validator: (value) {
                  if (value == '') {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
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
                validator: (value) {
                  if (value == '') {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
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
                initialValue: details['email'],
                validator: (value) {
                  if (value == '') {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
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
                      "Finish",
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
    ));
  }
}
