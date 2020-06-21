import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:CCApp/screens/login.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext  context){
    return MultiProvider(
      child: Consumer(
        builder: (context,auth,_)=>MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        ),
      ),
    );
  }
}