import 'package:codechefvitapp/expensesinputform.dart';
import 'package:flutter/material.dart';
class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}
List expenseDetails=[
  {
    'reason': 'DEVSOC 2020',
    'name': 'Dananjay Murugesh',
    'amount': '1000',
  }
];
List _expand = List.generate(20, (i) => false).toList();
Widget slideRightBackground() {
  return Container(
    color: Colors.white,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.cancel,
            color: Colors.black,
          ),
          SizedBox(width:15),
          Text(
            "Cancel",
            style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w600,
                fontSize: 19,
                fontFamily: 'SFProDisplay'
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    ),
  );
}
Widget slideLeftBackground() {
  return Container(
    color: Colors.white,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.black,
          ),
          SizedBox(width:15),
          Text(
            "Delete",
            style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w600,
                fontSize: 19,
                fontFamily: 'SFProDisplay'
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
}
class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
            'assets/codechef-1.JPG', fit: BoxFit.contain, height: 50),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                itemBuilder:(context,index){
                  return Dismissible(
                    onDismissed: (DismissDirection direction){
                      setState(() {
                        expenseDetails.removeAt(index);
                      });
                    },
                    background: slideRightBackground(),
                    secondaryBackground: slideLeftBackground(),
                    key: UniqueKey(),
                    // ignore: missing_return
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.endToStart) {
                        final bool res = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                    "Are you sure you want to delete this expense?"),
                                actions: <Widget>[
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
                                    onPressed: () {
                                      setState(() {
                                        expenseDetails.removeAt(index);
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                        return res;
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: _expand[index]
                          ?250.0
                          :150.0,
                      width:400,
                      margin: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: index%3==0?Colors.deepOrangeAccent:(index%3==1?Colors.blueAccent:Colors.pinkAccent)
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 4,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding:EdgeInsets.only(left: 18),
                                child: Text(
                                  expenseDetails[index]['reason'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(_expand[index]?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down),
                                onPressed: (){
                                  setState(() {
                                    _expand[index]=!_expand[index];
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(width: 10),
                                    Text(
                                      expenseDetails[index]['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 18
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(width: 10),
                                    Text(
                                      'Amount',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 18
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '₹',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 18
                                      ),
                                    ),
                                    Text(
                                      expenseDetails[index]['amount'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 18
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if(_expand[index])
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Image",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                        ],
                      ),
                    ),
                  );
                }
            ),
            SizedBox(height:12),
            Container(
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  showDialog(context: context,
                      builder: (context){
                        return Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                          elevation: 12,
                          child: ExpensesInputForm(),
                        );
                      }
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.blueAccent,
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent
                      ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
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
                              fontFamily: 'SFProDisplay'
                          ),
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
