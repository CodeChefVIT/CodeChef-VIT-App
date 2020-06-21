import 'package:flutter/material.dart';
import './homePage.dart';

class InputForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputFormState();
  }
}

class InputFormState extends State<InputForm> {
  String title, venue, date, time, description, members;

  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController membersController = TextEditingController();

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        width: 400,
        height: 600,
        padding: EdgeInsets.all(20),
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
              width: 300,
              child: TextField(
                controller: titleController,
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
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 5, right: 5),
                  width: 135,
                  child: TextField(
                    controller: timeController,
                    decoration: new InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      hintText: 'Time',
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
                  width: 2,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 5, right: 5),
                  width: 135,
                  child: TextField(
                    controller: dateController,
                    decoration: new InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      hintText: 'Date',
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
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 5, right: 5),
              width: 300,
              child: TextField(
                controller: venueController,
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
              width: 300,
              child: TextField(
                controller: descriptionController,
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
              width: 300,
              child: TextField(
                controller: membersController,
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
                  final String title=titleController.text;
                  final String time=timeController.text;
                  final String venue=venueController.text;
                  final String date=dateController.text;
                  final String description=descriptionController.text;
                  final String members=membersController.text;
                  setState(() {
                    meetingDetails.add({
                      'name': title,
                      'time': time,
                      'venue': venue,
                      'date': date,
                      'description': description,
                      'members': members
                      
                    });
                    print(meetingDetails);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomePage()));
                  });
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
                            margin: EdgeInsets.only(left: 40),
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
    );
  }
}
