import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import './homePage.dart';
import 'package:http/http.dart' as http;
import './signup_model.dart';

Future<SignupModel> createUser(String name,String email,String pass,String role,String key) async{
  final String apiUrl = "https://codechef-vit-cc.herokuapp.com/signup";
  final body =json.encode({
    "name":name,
	  "email":email,
	  "password":pass,
	  "role":role,
	  "key":key
  });

  final response = await http.post(apiUrl, headers: {
    "Content-Type":"application/json"
  },
  body:body);
  if(response.statusCode == 201){
    final String responseString = response.body;
      return signupModelFromJson(responseString); 
  }
  else{
    return null;
  }
}

class SignUpPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage>{

  SignupModel _user;
  bool visiblePassword = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController keyController = TextEditingController();


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
              controller: nameController,
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
          SizedBox(height: MediaQuery.of(context).size.height*20/896,),
            Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 44, right: 44),
            width: 326,
            child: TextField(
              obscureText: !visiblePassword,
              controller: passController,
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
          SizedBox(height: MediaQuery.of(context).size.height*20/896,),
            Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 44, right: 44),
            width: 326,
            child: TextField(
              controller: roleController,
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
              controller: keyController,
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
              onPressed: () async{
                final String name = nameController.text;
                final String email = emailController.text;
                final String pass = passController.text;
                final String role = roleController.text;
                final String key = keyController.text;

                final SignupModel user = await createUser(name, email, pass, role, key);

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