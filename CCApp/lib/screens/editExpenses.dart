import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:CCApp/providers/expenses.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:CCApp/screens/homePage.dart';

class EditExpenses extends StatefulWidget {
  final String name;
  final String bill;
  final int amount;
  final String remarks;
  final String status;
  final String comments;
  final int owner;
  final String uuid;

  EditExpenses({
    @required this.name,
    @required this.bill,
    @required this.amount,
    @required this.remarks,
    @required this.status,
    this.comments,
    @required this.owner,
    @required this.uuid
  });

  @override
  State<StatefulWidget> createState() {
    return EditExpensesState();
  }
}

class EditExpensesState extends State<EditExpenses> {
  Map<String, String> _data = {};
  final GlobalKey<FormState> _formKey = GlobalKey();

  Future<void> _submit() async {
    try {
      await Provider.of<Expense>(context, listen: false).expenseEdit(
          _data, Provider
          .of<Reg>(context, listen: false)
          .token, widget.uuid);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) =>
              HomePage(
                currentIndex: 2,
              ),
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

  List<DropdownMenuItem<String>> listDrop = [];

  void loadData() {
    listDrop = [];
    listDrop.add(new DropdownMenuItem(
        child: new Text('Paid'),
        value: 'Paid'
    )
    );
    listDrop.add(new DropdownMenuItem(
        child: new Text('Rejected'),
        value: 'Rejected'
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      width: 400,
      height: 450,
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
                  'Edit Expense',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5, right: 5),
                width: 300,
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  initialValue: widget.remarks,
                  validator: (value) {
                    if (value == '') {
                      return 'This field is required.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    _data['remarks'] = value;
                  },
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    hintText: 'Remarks',
                    hintStyle: TextStyle(
                      color: Color(0xFFC7C7C7),
                      fontSize: 18,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5, right: 5),
                width: 300,
                child: TextFormField(
                  initialValue: (widget.amount).toString(),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == '') {
                      return 'This field is required.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    _data['amount'] = value;
                  },
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    hintText: 'Amount',
                    hintStyle: TextStyle(
                      color: Color(0xFFC7C7C7),
                      fontSize: 18,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(left: 7),
                child: Text(
                  'Payment Status',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(left: 20),
                child: DropdownButton(
                  value:(_data['status']),
                  hint: Text('Status'),
                  items: listDrop,
                  onChanged:(value){
                      _data['status'] = value;
                      setState(() {});
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5, right: 5),
                width: 300,
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  initialValue: widget.comments,
                  validator: (value) {
                    if (value == '') {
                      return 'This field is required.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    _data['comments'] = value;
                  },
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    hintText: 'Payment Remarks',
                    hintStyle: TextStyle(
                      color: Color(0xFFC7C7C7),
                      fontSize: 18,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 20),
                height: 50,
                width: 300,
                child: FlatButton(
                  onPressed: () async {
                    await _submit();
                    print(_data);
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
                              margin: EdgeInsets.only(left: MediaQuery.of(context).size.height *
                                  18 /
                                  896),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height *
                                      25 /
                                      896),
                              alignment: Alignment.center,
                              child: Text(
                                "Edit Expense",
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
                        )
                    ),
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
