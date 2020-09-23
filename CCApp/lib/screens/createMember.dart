import 'package:CCApp/providers/memberdata.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homePage.dart';

class CreateMember extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateMemberState();
  }
}

class CreateMemberState extends State<CreateMember> {
  Map _data = {};
  String dropdownValue = "1";
  final GlobalKey<FormState> _formKey = GlobalKey();
  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    try {
      await Provider.of<MemberData>(context, listen: false)
          .createMember(Provider.of<Reg>(context, listen: false).token, _data);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => HomePage(
            currentIndex: 3,
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

  String getPosition(String value) {
    if (value == "1") {
      return "Fresher";
    }
    if (value == "2") {
      return "Senior";
    }
    if (value == "3") {
      return "Board";
    }
    if (value == "4") {
      return "Ex Member";
    } else {
      return "President";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          width: 400,
          height: 250,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(left: 7),
                child: Text(
                  'Add Member',
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
                width: 300,
                child: TextFormField(
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: 'Reg Number',
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27.5),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 5, right: 5),
                width: 300,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  iconSize: 24,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      _data['category'] = int.parse(newValue);
                    });
                  },
                  items: <String>['1', '2', '3', '4', '5']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        getPosition(value),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              FlatButton(
                onPressed: () async {
                  _submit();
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
                      height: 50,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 15),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Update Details",
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
            ],
          ),
        ),
      ),
    );
  }
}
