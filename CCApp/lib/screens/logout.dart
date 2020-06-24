import 'package:CCApp/providers/reg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:CCApp/main.dart';

class LogOut extends StatefulWidget {
  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Log Out"),
      onPressed: () async {
              await Provider.of<Reg>(context, listen: false).logout();
              RestartWidget.restartApp(context); 
            },
    );
  }  
}

