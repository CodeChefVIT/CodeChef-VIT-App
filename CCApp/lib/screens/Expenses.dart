import 'package:CCApp/screens/expensesinputform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

List expenseDetails = [
  {
    'reason': 'DEVSOC 2020',
    'name': 'Dananjay Murugesh',
    'amount': '1000',
  }
];
List _expand = List.generate(20, (i) => false).toList();
int height=0;
class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 42),
            Container(
              width: double.infinity,
              height: 54,
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/fulllogo.png'),
            ),
            SizedBox(height: 14),
            Container(
              padding: EdgeInsets.only(left: 30),
              alignment: Alignment.centerLeft,
              child: Text(
                'Expenses',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  fontFamily: 'SFProDisplay',
                ),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: expenseDetails.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    actionPane: SlidableScrollActionPane(),
                    actionExtentRatio: 0.3,
                    actions: [
                      SlideAction(
                        child: Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.pencilAlt,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Edit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          margin: EdgeInsets.fromLTRB(30, 0, 0, 18),
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(24)),
                            color: Color(0xFF34C759),
                          ),
                        ),
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(24)),
                                  elevation: 12,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    child: Center(child: Text("Edit")),
                                  ),
                                );
                              });
                        },
                      ),
                    ],
                    secondaryActions: [
                      SlideAction(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
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
                            height: 500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(24)),
                              color: Color(0xFFFF3B30),
                            ),
                          ),
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    elevation: 12,
                                    child: Container(
                                      height: 105,
                                      width: 330,
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(height: 20,),
                                          Text(
                                            'Are you sure you want to delete this expenditure?',
                                          ),
                                          SizedBox(height: 16,),
                                          Row(
                                            children: <Widget>[
                                              SizedBox(width: 150,),
                                              FlatButton(
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              FlatButton(
                                                child: Text(
                                                  "Delete",
                                                  style: TextStyle(color: Colors.red),
                                                ),
                                                onPressed: (){},
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }),
                    ],
                    child: AnimatedContainer(
                      curve: Curves.bounceOut,
                      duration: Duration(milliseconds: 700),
                      margin: EdgeInsets.fromLTRB(
                          30, 0, 30, MediaQuery.of(context).size.height * 20 / 896),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: index % 3 == 0
                      ? Colors.deepOrangeAccent
                          : (index % 3 == 1
                      ? Colors.blueAccent
                          : Colors.pinkAccent)),
                      width: 350,
                      height: _expand[index]
                          ? MediaQuery.of(context).size.height * 140 / 896 + height * 25 + 55
                          : 110,
                      child: Column(
                        children: [
                        Row(
                        children: [
                        Container(
                      alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(34,
                            MediaQuery.of(context).size.height * 22 / 896 - 3, 0, 0),
                        child: Text(
                          expenseDetails[index]['reason'],
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
                            _expand[index]
                                ? FontAwesomeIcons.arrowUp
                                : FontAwesomeIcons.arrowDown,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _expand[index] = !_expand[index];
                              print(_expand[index]);
                            });
                          },
                        ),
                      )
                      ],
                    ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: index % 3 == 0
                                  ? Colors.deepOrangeAccent
                                  : (index % 3 == 1
                                  ? Colors.blueAccent
                                  : Colors.pinkAccent),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            height: MediaQuery.of(context).size.height * 54 / 896,
                            width: 394,
                            padding: EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              child: Text(
                                expenseDetails[index]['name'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                    _expand[index]
                        ? Flexible(
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                              child: Text(
                                "Amount",
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
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "₹",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'SF Pro Display',
                                      fontSize: MediaQuery.of(context).size.height *
                                          18 /
                                          896,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    expenseDetails[index]['amount'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'SF Pro Display',
                                      fontSize: MediaQuery.of(context).size.height *
                                          18 /
                                          896,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: 10,
                        ),
                      ),
                    ]
                    ),
                  ): Container(
                      height: 0,
                      width: 0,
                    )
                  ],
                  )
                  ),
                  );
                }),
            SizedBox(height: 12),
            Container(
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          elevation: 12,
                          child: ExpensesInputForm(),
                        );
                      });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blueAccent,
                          Colors.deepOrangeAccent,
                          Colors.pinkAccent
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20),
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                        ),
                        SizedBox(width: 50),
                        Text(
                          "Add Expense",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontFamily: 'SFProDisplay'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
