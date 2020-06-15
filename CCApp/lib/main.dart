import 'dart:convert';
import 'package:CCApp/homePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './SignUpPage.dart';
import './login_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

Future<LoginModel> createUser(String email,String pass) async{
  final String apiUrl = "https://codechef-vit-cc.herokuapp.com/login";
  final body =json.encode({
	  "email":email,
	  "password":pass,
  });

  final response = await http.post(apiUrl, headers: {
    "Content-Type":"application/json"
  },
  body:body);
  if(response.statusCode == 200){
    final String responseString = response.body;
      return loginModelFromJson(responseString); 
  }
  else{
    return null;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen()
    );
  }
}

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {

  bool visiblePassword = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginModel _user;
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
          SizedBox(height: MediaQuery.of(context).size.height * 44 / 896,),
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
          SizedBox(height: MediaQuery.of(context).size.height * 45 / 896,),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 44, right: 44),
            width: 326,
            child: TextField(
              controller: emailController,
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
              obscureText: !visiblePassword,
              controller: passController,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xFF1D59A1),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    visiblePassword
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                    color: Color(0xFF1D59A1),
                  ), 
                  onPressed: (){
                    setState(() {
                      visiblePassword = !visiblePassword;
                    });
                  }),
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
              onPressed: () async {
                final String email = emailController.text;
                final String pass = passController.text;

                final LoginModel user = await createUser(email, pass);

                setState((){
                  _user=user;
                });
                if(_user!=null){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                    builder: (context) => HomePage()
                  )
                );
                }
                else{
                  print("error");
                }
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
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 95,),
              Text("Don't have an account?",
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'SF Pro Display',
                color: Colors.black,
              ),
              ),
              FlatButton(
                onPressed: (){
                  Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignUpPage()
                )
              );
                },
                child: Text("Sign Up",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                    color: Color(0xFF1D59A1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          Expanded(child: SizedBox(height: MediaQuery.of(context).size.height * 54 / 896,)),
          Image.asset('assets/images/grad.png'),
        ],
      )
    );
  }
}

