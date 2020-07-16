import 'package:CCApp/screens/Expenses.dart';
import 'package:flutter/material.dart';

class ExpensesInputForm extends StatefulWidget {
  @override
  _ExpensesInputFormState createState() => _ExpensesInputFormState();
}

class _ExpensesInputFormState extends State<ExpensesInputForm> {
  String reason,name,amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      width: 400,
      height: 400,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left:7),
              child: Text(
                'Add an Expense',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 5, right: 5),
              width: 300,
              child: TextField(
                textInputAction: TextInputAction.done,
                onChanged: (String text){
                  reason = text;
                },
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  hintText: 'Reason for Expenditure',
                  hintStyle: TextStyle(
                    color: Color(0xFFC7C7C7),
                    fontSize: 18,
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(27.5)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(27.5)),
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
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 5, right: 5),
              width: 300,
              child: TextField(
                textInputAction: TextInputAction.done,
                onChanged: (String text){
                  name = text;
                },
                keyboardType: TextInputType.multiline,
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  hintText: 'Name',
                  hintStyle: TextStyle(
                    color: Color(0xFFC7C7C7),
                    fontSize: 18,
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(27.5)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(27.5)),
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
              child: TextField(
                textInputAction: TextInputAction.done,
                onChanged: (String text){
                  amount = text;
                },
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  hintText: 'Amount',
                  hintStyle: TextStyle(
                    color: Color(0xFFC7C7C7),
                    fontSize: 18,
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(27.5)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(27.5)),
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
              margin: EdgeInsets.only(left:5, right: 5, bottom:10, top: 20),
              height: 50,
              width: 300,
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    expenseDetails.add({'reason':reason,'name':name,'amount':amount,});
                    print(expenseDetails);
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xFF459AFF), Color(0xFFFF6745),Color(0xFFFF4572)]),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left:15),
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
                              "Add Expense",
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
    );
  }
}
