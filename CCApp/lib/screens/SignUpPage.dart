import 'package:CCApp/screens/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import './homePage.dart';
import 'package:provider/provider.dart';
import '../providers/reg.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  bool visiblePassword = false;

  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _data = {};

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    print(_data);
    try {
      await Provider.of<Reg>(context, listen: false).signup(_data);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => HomePage(),
        ),
      );
    } catch (e) {
      await showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Error'),
          content: Text('Signup Could not be completed.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 70 / 896),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.arrowLeft),
                  color: Color(0xFF1D59A1),
                  onPressed: () {
                    Navigator.of(context).pop(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 89 / 896,
                  width: double.infinity,
                  child: Image.asset('assets/images/fulllogo.png'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 36 / 896,
                ),
                Container(
                  padding: EdgeInsets.only(left: 44),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 20 / 896,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 44, right: 44),
                  width: 326,
                  child: TextFormField(
                    validator: (value) {
                        if (value == '') {
                          return 'This field is required.';
                        }
                      },
                      onSaved: (value) {
                        _data['name'] = value;
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
                  height: MediaQuery.of(context).size.height * 20 / 896,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 44, right: 44),
                  width: 326,
                  child: TextFormField(
                    validator: (value) {
                        if (value == '') {
                          return 'This field is required.';
                        }
                      },
                      onSaved: (value) {
                        _data['email'] = value;
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
                  height: MediaQuery.of(context).size.height * 20 / 896,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 44, right: 44),
                  width: 326,
                  child: TextFormField(
                    onSaved: (value) {
                        _data['password'] = value;
                      },
                    validator: (value) {
                        if (value == '') {
                          return 'This field is required.';
                        }
                      },
                    obscureText: !visiblePassword,
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
                  height: MediaQuery.of(context).size.height * 20 / 896,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 44, right: 44),
                  width: 326,
                  child: TextFormField(
                    validator: (value) {
                        if (value == '') {
                          return 'This field is required.';
                        }
                      },
                      onSaved: (value) {
                        _data['regno'] = value;
                      },
                    decoration: new InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: Icon(
                        Icons.assignment_ind,
                        color: Color(0xFF1D59A1),
                      ),
                      hintText: 'Registeration Number',
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
                  height: MediaQuery.of(context).size.height * 20 / 896,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 57 / 896 - 12,
                ),
                Container(
                  margin: EdgeInsets.only(left: 44, right: 44),
                  height: MediaQuery.of(context).size.height * 66 / 896,
                  width: 326,
                  child: FlatButton(
                    onPressed: () async {
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
        ),
      ),
    );
  }
}
