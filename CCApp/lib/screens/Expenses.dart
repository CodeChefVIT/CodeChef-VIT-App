import 'package:CCApp/screens/editExpenses.dart';
import 'package:CCApp/screens/expenseCard.dart';
import 'package:CCApp/screens/expensesinputform.dart';
import 'package:CCApp/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:provider/provider.dart';
import 'package:CCApp/providers/expenses.dart';

class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

List expenseDetails = [];
int height=0;
class _ExpensesState extends State<Expenses> {
  bool _isLoading = false;
  bool board = false;
  int check;

  @override
  void initState() {
    check = Provider
        .of<Reg>(context, listen: false)
        .category;
    if (check == 5 || check == 3) {
      board = true;
    }
    getData();
    super.initState();
  }

  Future<void> getData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Expense>(context, listen: false)
          .expenseView(Provider.of<Reg>(context, listen: false)
          .token);
      setState(() {
        expenseDetails = Provider.of<Expense>(context, listen: false)
            .details;
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
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : board
        ? Stack(
          children: [
            Column(
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
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  width: double.infinity,
                  height:
                  MediaQuery.of(context).size.height * 600 / 896 - 50,
                  child: ListView.builder(
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
                                          child: EditExpenses(
                                            uuid: expenseDetails[index]['uuid'],
                                            name: expenseDetails[index]['name'],
                                            bill: expenseDetails[index]['bill'],
                                            amount: expenseDetails[index]['amount'],
                                            remarks: expenseDetails[index]['remarks'],
                                            status: expenseDetails[index]['status'],
                                            comments: expenseDetails[index]['comments'],
                                            owner: expenseDetails[index]['owner'],
                                          )
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
                                            height: MediaQuery.of(context).size.height * 16.5 / 100,
                                            width: MediaQuery.of(context).size.width * 200 / 896,
                                            child: Column(
                                              children: <Widget>[
                                                SizedBox(height: MediaQuery.of(context).size.height * 18 / 896,),
                                                Padding(
                                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 18 / 896,),
                                                  child: Text(
                                                    'Are you sure you want to delete this expenditure?',
                                                  ),
                                                ),
                                                SizedBox(height: 16,),
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(width: MediaQuery.of(context).size.height * 118 / 896,),
                                                    FlatButton(
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color: Colors.black),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                    FlatButton(
                                                      child: Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                                      onPressed: () async {
                                                        await Provider.of<Expense>(
                                                            context,
                                                            listen: false)
                                                            .deleteExpense(
                                                            Provider
                                                                .of<Reg>(context,
                                                                listen: false)
                                                                .token,
                                                            expenseDetails[index]['uuid']);
                                                        setState(() {
                                                          expenseDetails.removeAt(index);
                                                        });
                                                        Navigator.of(context).pop();
                                                      },
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
                          child: ExpenseCard(
                              name: expenseDetails[index]['name'],
                              amount: expenseDetails[index]['amount'],
                              remarks: expenseDetails[index]['remarks'],
                              bill: expenseDetails[index]['bill'],
                              status: expenseDetails[index]['status'],
                              comments: expenseDetails[index]['comments'],
                              bgcolor: getColor(index),
                              sgcolor: getColor(index)
                          ),
                        );
                      }),
                ),
              ),
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
          ],
        )
        : Stack(
          children: [
                Column(
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
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          width: double.infinity,
                          height:
                          MediaQuery.of(context).size.height * 600 / 896 - 50,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: expenseDetails.length,
                              itemBuilder: (context, index) {
                                return ExpenseCard(
                                    name: expenseDetails[index]['name'],
                                    amount: expenseDetails[index]['amount'],
                                    remarks: expenseDetails[index]['remarks'],
                                    bill: expenseDetails[index]['bill'],
                                    status: expenseDetails[index]['status'],
                                    comments: expenseDetails[index]['comments'],
                                    bgcolor: getColor(index),
                                    sgcolor: getColor(index)
                                );
                              }
                          ),
                        ),
                      ),
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
                    ]
                )
          ],
        );
  }
}
