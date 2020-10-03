import 'package:CCApp/providers/meeting.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:CCApp/screens/attendanceCard.dart';
import 'package:CCApp/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ViewAttendance extends StatefulWidget {
  final String uuid;

  ViewAttendance({@required this.uuid});
  @override
  _ViewAttendanceState createState() => _ViewAttendanceState();
}

class _ViewAttendanceState extends State<ViewAttendance> {
  List memberDetails = [];

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
      await Provider.of<MeetingData>(context, listen: false).viewAttendance(
          Provider.of<Reg>(context, listen: false).token, widget.uuid);
      setState(() {
        memberDetails =
            Provider.of<MeetingData>(context, listen: false).attendance;
      });
      print(memberDetails);
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _moveBack(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => HomePage(currentIndex: 0)));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _moveBack(context);
        return null;
      },
      child: _isLoading
          ? Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
              body: Column(children: [
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 20),
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.arrowCircleLeft,
                    color: Colors.blue,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => HomePage(
                          currentIndex: 0,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(top: 5),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 600 / 896 - 50,
                child: memberDetails == null
                    ? Container
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: memberDetails.length,
                        itemBuilder: (context, index) {
                          return AttendanceCard(
                            color: getColor(index),
                            name: memberDetails[index]['name'],
                            regno: memberDetails[index]['regno'],
                            status: memberDetails[index]['attendance'],
                          );
                        }),
              ))
            ])),
    );
  }
}
