import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpenseCard extends StatefulWidget {
  final String remarks;
  final String name;
  final int amount;
  final String status;
  final String comments;
  final String bill;
  final Color bgcolor;
  final Color sgcolor;

  ExpenseCard({
    this.remarks,
    @required this.name,
    @required this.amount,
    @required this.status,
    this.comments,
    this.bill,
    @required this.bgcolor,
    @required this.sgcolor,
});
  @override
  State<StatefulWidget> createState() {
    return ExpenseCardState();
  }
}
class ExpenseCardState extends State<ExpenseCard> {
  int height=0;
  bool isPressed = false;
  String temp;
  List colors = [
    0xFF459AFF,
    0xFFFF6745,
    0xFFFF4572,
    0xFF7BB7FF,
    0xFFFF967E,
    0xFFFF6C90
  ];
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        curve: Curves.bounceOut,
        duration: Duration(milliseconds: 700),
        margin: EdgeInsets.fromLTRB(
            30, 0, 30, MediaQuery.of(context).size.height * 20 / 896),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            color: widget.bgcolor,
        ),
        width: 350,
        height: isPressed
            ? MediaQuery.of(context).size.height * 140 / 896 + height * 25 + 150
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
                    widget.name,
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
                      isPressed
                          ? FontAwesomeIcons.arrowUp
                          : FontAwesomeIcons.arrowDown,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isPressed = !isPressed;
                        print(isPressed);
                      });
                    },
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: widget.bgcolor,
              ),
              margin: EdgeInsets.symmetric(horizontal: 25),
              height: MediaQuery.of(context).size.height * 54 / 896,
              width: 394,
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Text(
                  (widget.remarks)==null
                  ?''
                  :(widget.remarks),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            isPressed
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
                                  (widget.amount).toString(),
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
                    SizedBox(height:5),
                    Flexible(
                      child: Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            (widget.bill!=null)
                            ?showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24)),
                                    elevation: 12,
                                    child: Image.network(widget.bill),
                                  );
                                })
                                :showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24)),
                                    elevation: 12,
                                    child: Container(
                                      height: 100,
                                        width:120,
                                        child: Row(
                                          children: <Widget>[
                                            SizedBox(width:35),
                                            Icon(
                                              Icons.close,
                                              color: Colors.red,
                                              size: 40,
                                            ),
                                            SizedBox(width:10),
                                            Text(
                                                'No bill uploaded',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  );
                                });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints:
                              BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Center(
                                child: Text(
                                  "View Bill",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontFamily: 'SFProDisplay'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(height: 10,),
                    ),
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: (widget.status)=='Paid'
                                  ? Colors.green
                                  : ((widget.status)=='Rejected'?Colors.red:Colors.grey),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            height: MediaQuery.of(context).size.height * 50 / 896,
                            width: (widget.status)=='Paid'||(widget.status)=='Rejected'
                                ? 85
                                : 125,
                            padding: EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                (widget.status)!='Paid'&&(widget.status)!='Rejected'
                                ?'Not Reviewed'
                                :(widget.status),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.red,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 0),
                            height: (widget.comments)!=null&&((widget.status)=='Paid'||(widget.status)=='Rejected')
                                ?MediaQuery.of(context).size.height * 50 / 896
                                :0,
                            width: (widget.comments)!=null&&((widget.status)=='Paid'||(widget.status)=='Rejected')
                                  ?192
                                  :0,
                            padding: EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                (widget.comments),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
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
    );
  }
}
