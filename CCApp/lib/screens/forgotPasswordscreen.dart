import 'package:CCApp/providers/reg.dart';
import 'package:CCApp/screens/enterOTP.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  TextEditingController email = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;
  Map<String, String> _data = {};

  Future<void> _submit() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      _formKey.currentState.save();
      try {
        await Provider.of<Reg>(context, listen: false).sendOTP(_data);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => OTPScreen(),
          ),
        );
      } catch (error) {
        await showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Error'),
            content: Text(error.toString()),
          ),
        );
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Forgot Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 4 / 100,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter Email address',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 2 / 100,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value == '') {
                          return 'This field is empty';
                        } else {
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
                    height: size.height * 4 / 100,
                  ),
                  FlatButton(
                    onPressed: () {
                      _data['email'] = email.text;
                      _submit();
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF1D59A1)),
                      width: size.width * 7 / 10,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
