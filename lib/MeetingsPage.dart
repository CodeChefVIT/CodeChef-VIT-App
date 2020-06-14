import 'dart:ui';
import 'package:flutter/material.dart';

class Meetings extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return MeetingsState();
  }
}

class MeetingsState extends State<Meetings>{
  @override
  @override
  Widget build(BuildContext context){
    return Stack(
        children:[
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height:42),
              Container(
                width: double.infinity,
                height: 54,
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/fulllogo.png'),
              ),
              SizedBox(height: 14,),
              Container(
                padding: EdgeInsets.only(left:30),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Meetings',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ]
    );
  }}