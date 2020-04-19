import 'package:CCApp/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen()
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 100 / 896),
          Container(
            height: MediaQuery.of(context).size.height * 89 / 896,
            width: double.infinity,
            child: Image.asset('assets/images/fulllogo.png'),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 64 / 896,),
          Container(
            margin: EdgeInsets.only(left: 44),
            child: Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 30,
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro Display',
                color: Color(0xFF1D59A1),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 65 / 896,),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 44, right: 44),
            width: 326,
            child: TextField(
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
          SizedBox(height: MediaQuery.of(context).size.height * 33 / 896,),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 44, right: 44),
            width: 326,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
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
          Expanded(child: SizedBox(height: MediaQuery.of(context).size.height * 54 / 896,)),
          Image.asset('assets/images/grad.png'),
        ],
      )
    );
  }
}

