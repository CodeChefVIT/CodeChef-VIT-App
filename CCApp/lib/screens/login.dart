import 'package:CCApp/screens/homePage.dart';
import 'package:flutter/material.dart';
import './SignUpPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _data = {};

  bool visiblePassword = false;

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    try {
      await Provider.of<Reg>(context, listen: false).login(_data);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => HomePage(),
        ),
      );
    } catch (error) {
      await showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Error'),
          content: Text('Login Failed'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 100 / 896),
              Container(
                height: MediaQuery.of(context).size.height * 89 / 896,
                width: double.infinity,
                child: Image.asset('assets/images/fulllogo.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 44 / 896,
              ),
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 45 / 896,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 44, right: 44),
                width: 326,
                child: TextFormField(
                  onSaved: (value) {
                    _data['email'] = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == '') {
                      return 'This field is empty';
                    }
                    else{
                          return null;
                        }
                  },
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
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Color(0xFF1D59A1),
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 33 / 896,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 44, right: 44),
                width: 326,
                child: TextFormField(
                  validator: (value) {
                    if (value == '') {
                      return 'This field is empty.';
                    }
                    else{
                          return null;
                        }
                  },
                  obscureText: !visiblePassword,
                  onSaved: (value) {
                    _data['password'] = value;
                  },
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
                        onPressed: () {
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
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Color(0xFF1D59A1),
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 57 / 896 - 12,
              ),
              Container(
                margin: EdgeInsets.only(left: 44, right: 44),
                height: MediaQuery.of(context).size.height * 66 / 896,
                width: 326,
                child: FlatButton(
                  onPressed: () {
                    _submit();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33),
                  ),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF3BE0EB), Color(0xFF1D59A1)]),
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
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 95,
                  ),
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      color: Colors.black,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      "Sign Up",
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
              Expanded(
                  child: SizedBox(
                height: MediaQuery.of(context).size.height * 54 / 896,
              )),
              Image.asset('assets/images/grad.png'),
            ],
          ),
        ),
      ),
    );
  }
}
