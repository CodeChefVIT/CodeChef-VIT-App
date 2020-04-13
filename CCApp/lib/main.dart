import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Container(
              height: 89,
              width: double.infinity,
              child: Image.asset('assets/images/fulllogo.png'),
            ),
            SizedBox(height: 64,),
            Container(
              margin: EdgeInsets.only(left: 44),
              child: Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF Pro Display',
                  color: Color(0xFF1D59A1),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 44),
              child: Text(
                'Login to continue.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF Pro Display',
                  color: Color(0xFF1D59A1),
                ),
              ),
            ),
            SizedBox(height: 65,),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 44, right: 44),
              width: 326,
              height: 52,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
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
            SizedBox(height: 33,),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 44, right: 44),
              width: 326,
              height: 52,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
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
            SizedBox(height: 57,),
            Container(
              margin: EdgeInsets.only(left:44, right: 44),
              height: 66,
              width: 326,
              child: FlatButton(
                onPressed: (){},
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
                      "Login",
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
            SizedBox(height: 54,),
            Image.asset('assets/images/grad.png'),
          ],
        )
      )
    );
  }
}

