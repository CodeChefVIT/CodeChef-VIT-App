import 'package:CCApp/providers/memberdata.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homePage.dart';

class MemberForm extends StatefulWidget {
  final String regno;
  final int category;
  final String uuid;

  MemberForm(
      {@required this.regno, @required this.category, @required this.uuid});

  @override
  State<StatefulWidget> createState() {
    return MemberFormState();
  }
}

class MemberFormState extends State<MemberForm> {
  Map _data = {};
  String dropdownValue;
  void initState() {
    super.initState();
    dropdownValue = widget.category.toString();
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      width: 400,
      height: 250,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 7),
              child: Text(
                'Edit Member',
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
                initialValue: widget.regno,
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
                await Provider.of<MemberData>(context, listen: false)
                    .memberEdit(
                        _data,
                        Provider.of<Reg>(context, listen: false).token,
                        widget.uuid);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage(
                          currentIndex: 3,
                        )));
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
    );
  }
}
