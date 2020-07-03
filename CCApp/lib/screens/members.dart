import 'dart:io';
import 'package:CCApp/providers/memberdata.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:CCApp/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

import 'memberDetails.dart';

class Members extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MembersState();
  }
}

class MembersState extends State<Members> {
  List<dynamic> memberDetails = [];
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
      await Provider.of<MemberData>(context, listen: false)
          .memberDetails(Provider.of<Reg>(context, listen: false).token);
      setState(() {
        memberDetails = Provider.of<MemberData>(context, listen: false).details;
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
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 30 / 414,
                        MediaQuery.of(context).size.height * 70 / 896,
                        0,
                        0),
                    child: Text(
                      'Members',
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
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
                        top: MediaQuery.of(context).size.height * 75 / 896),
                    child: FlatButton(
                        onPressed: () async {
                          var filePath = await FilePicker.getFilePath(
                              type: FileType.custom,
                              allowedExtensions: ['xlsx']);
                          await Provider.of<MemberData>(context, listen: false)
                              .dataUpload(
                            filePath,
                            Provider.of<Reg>(context, listen: false).token,
                          );
                        },
                        child: Text(
                          'UPLOAD',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(top: 5),
                      width: double.infinity,
                      height:
                          MediaQuery.of(context).size.height * 600 / 896 - 50,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: memberDetails.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              actionPane: SlidableScrollActionPane(),
                              actions: [
                                SlideAction(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          FaIcon(
                                            FontAwesomeIcons.upload,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Update",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                    margin: EdgeInsets.fromLTRB(30, 0, 0, 18),
                                    height: 70,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(24)),
                                      color: Color(0xFF34C759),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              ],
                              secondaryActions: [
                                SlideAction(
                                    child: Container(
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.times,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      margin: EdgeInsets.fromLTRB(0, 0, 30, 18),
                                      height: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24)),
                                        color: Color(0xFFFF3B30),
                                      ),
                                    ),
                                    onTap: () {}),
                              ],
                              child: Container(
                                child: MemberDetails(
                                  name: 'name',
                                  regno: memberDetails[index]['regno'],
                                  category: memberDetails[index]['category'],
                                  color: getColor(index),
                                ),
                              ),
                            );
                          }))),
            ]),
    );
  }
}
