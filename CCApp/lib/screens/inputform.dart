import 'package:CCApp/providers/meeting.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:CCApp/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class InputForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputFormState();
  }
}

class InputFormState extends State<InputForm> {
  bool timePicked = false;
  TimeOfDay time;
  String timeString;
  bool datePicked = false;
  String dateDisplay;
  DateTime date;
  String dateString;
  String timeDisplay;
  void initState() {
    date = DateTime.now();
    time = TimeOfDay.now();
    super.initState();
  }

  Future _pickTime(BuildContext context) async {
    print('entered');
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null && t != time)
      setState(() {
        time = t;
        timeString = '${time.hour}:${time.minute}:00';
        if (time.hour > 12) {
          timeDisplay =
              '${time.hour - 12}:${time.minute > 10 ? time.minute : "0" + time.minute.toString()} PM';
        } else {
          timeDisplay =
              '${time.hour}:${time.minute > 10 ? time.minute : "0" + time.minute.toString()} AM';
        }
        timePicked = true;
      });
  }

  String getMonth(int month) {
    if (month == 01) {
      return "Jan";
    }
    if (month == 02) {
      return "Feb";
    }
    if (month == 03) {
      return "Mar";
    }
    if (month == 04) {
      return "Apr";
    }
    if (month == 05) {
      return "May";
    }
    if (month == 06) {
      return "Jun";
    }
    if (month == 07) {
      return "Jul";
    }
    if (month == 08) {
      return "Aug";
    }
    if (month == 09) {
      return "Sep";
    }
    if (month == 10) {
      return "Oct";
    }
    if (month == 11) {
      return "Nov";
    }
    if (month == 12) {
      return "Dec";
    } else {
      return "";
    }
  }

  Future _pickDate(BuildContext context) async {
    DateTime dateChosen = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: date,
    );
    if (dateChosen != null)
      setState(() {
        date = dateChosen;
        dateString = '${date.year}-${date.month}-${date.day}';
        dateDisplay =
            '${date.day} ' + '${getMonth(date.month)}' + ' ${date.year}';
        datePicked = true;
      });
  }

  Map<String, String> _data = {};
  final GlobalKey<FormState> _formKey = GlobalKey();
  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    try {
      await Provider.of<MeetingData>(context, listen: false)
          .meetingCreate(_data, Provider.of<Reg>(context, listen: false).token);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => HomePage(
            currentIndex: 0,
          ),
        ),
      );
    } catch (error) {
      print(error);
      await showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Error'),
          content: Text('Meeting Create Failed'),
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      width: 400,
      height: 600,
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
                  'Add a Meeting',
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: 'Title',
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
                height: MediaQuery.of(context).size.height * 50 / 896,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xff000000)),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xffffffff),
                ),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.height * 280 / 896,
                child: FlatButton(
                  onPressed: () async {
                    await _pickTime(context);
                    _data['time'] = timeString;
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          FontAwesomeIcons.clock,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          timePicked ? timeDisplay : "Pick a time",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 50 / 896,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xff000000)),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xffffffff),
                ),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.height * 280 / 896,
                child: FlatButton(
                  onPressed: () async {
                    await _pickDate(context);
                    _data['date'] = dateString;
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          FontAwesomeIcons.calendarAlt,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          datePicked ? dateDisplay : "Pick a date",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
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
                  validator: (value) {
                    if (value == '') {
                      return 'This field is required.';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _data['venue'] = value;
                  },
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: 'Venue',
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
                  validator: (value) {
                    if (value == '') {
                      return 'This field is required.';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _data['description'] = value;
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
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
                  validator: (value) {
                    if (value == '') {
                      return 'This field is required.';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _data['members'] = value;
                  },
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: 'Members',
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
                  onPressed: () {
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
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              width: 300 / 4,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Add Meeting",
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
