import 'package:flutter/material.dart';
import './homePage.dart';

class SignUpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 100 / 896),
            Container(
              height: MediaQuery.of(context).size.height * 89 / 896,
              width: double.infinity,
              child: Image.asset('assets/images/fulllogo.png'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 36/896,),
            Container(
              padding: EdgeInsets.only(left:44),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF Pro Display',
                  fontSize: 24,
                  color: Color(0xFF1D59A1),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*20/896,),
            Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 44, right: 44),
            width: 326,
            child: TextField(
              onChanged: (text){
              },
              keyboardType: TextInputType.name,
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xFF1D59A1),
                ),
                hintText: 'Name',
                hintStyle: TextStyle(
                  color: Color(0xFFC7C7C7),
                  fontSize: 18,
                ),
                enabledBorder: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(const Radius.circular(27.5)),
                  borderSide: BorderSide(
                    color: Color(0xFF1D59A1),
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
          SizedBox(height: MediaQuery.of(context).size.height*20/896,),
            Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 44, right: 44),
            width: 326,
            child: TextField(
              onChanged: (text){
              },
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xFF1D59A1),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Color(0xFFC7C7C7),
                  fontSize: 18,
                ),
                enabledBorder: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(const Radius.circular(27.5)),
                  borderSide: BorderSide(
                    color: Color(0xFF1D59A1),
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
          SizedBox(height: MediaQuery.of(context).size.height*20/896,),
            Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 44, right: 44),
            width: 326,
            child: TextField(
              onChanged: (text){
              },
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xFF1D59A1),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Color(0xFFC7C7C7),
                  fontSize: 18,
                ),
                enabledBorder: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(const Radius.circular(27.5)),
                  borderSide: BorderSide(
                    color: Color(0xFF1D59A1),
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
          SizedBox(height: MediaQuery.of(context).size.height*20/896,),
            Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 44, right: 44),
            width: 326,
            child: TextField(
              onChanged: (text){
              },
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                prefixIcon: Icon(
                  Icons.assignment_ind,
                  color: Color(0xFF1D59A1),
                ),
                hintText: 'Role',
                hintStyle: TextStyle(
                  color: Color(0xFFC7C7C7),
                  fontSize: 18,
                ),
                enabledBorder: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(const Radius.circular(27.5)),
                  borderSide: BorderSide(
                    color: Color(0xFF1D59A1),
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
          SizedBox(height: MediaQuery.of(context).size.height*20/896,),
            Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 44, right: 44),
            width: 326,
            child: TextField(
              onChanged: (text){
              },
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                prefixIcon: Icon(
                  Icons.category,
                  color: Color(0xFF1D59A1),
                ),
                hintText: 'Category',
                hintStyle: TextStyle(
                  color: Color(0xFFC7C7C7),
                  fontSize: 18,
                ),
                enabledBorder: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(const Radius.circular(27.5)),
                  borderSide: BorderSide(
                    color: Color(0xFF1D59A1),
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
          SizedBox(height: MediaQuery.of(context).size.height * 57 / 896 - 12,),
          Container(
            margin: EdgeInsets.only(left:44, right: 44),
            height: MediaQuery.of(context).size.height * 66 / 896,
            width: 326,
            child: FlatButton(
              onPressed: (){
                Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage()
                )
              );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(33),
              ),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFF3BE0EB), Color(0xFF1D59A1)]),
                  borderRadius: BorderRadius.circular(33),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}