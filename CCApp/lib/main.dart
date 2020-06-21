import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:CCApp/screens/login.dart';
import 'package:CCApp/providers/reg.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext  context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Reg(),)
      ],
      child: Consumer<Reg>(
        builder: (context,reg,_)=>MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        ),
      ),
    );
  }
}