import 'package:CCApp/providers/reg.dart';
import 'package:CCApp/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  final String otp;
  @override
  ResetPassword({@required this.otp});
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email;
  bool _isLoading = false;
  Map<String, String> _data = {};
  TextEditingController password = TextEditingController();
  void initState() {
    super.initState();
    email = Provider.of<Reg>(context, listen: false).resetEmail;
  }

  Future<void> _submit() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      _formKey.currentState.save();
      try {
        print(_data);
        int code = await Provider.of<Reg>(context, listen: false).resetPassword(_data);
        if (code == 200) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => LoginScreen(),
            ),
          );
        } else {
          await showDialog(
            context: context,
            child: AlertDialog(
              title: Text('Error'),
              content: Text('Incorrect OTP'),
            ),
          );
        }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 50 / 896),
                    Container(
                      height: MediaQuery.of(context).size.height * 69 / 896,
                      width: double.infinity,
                      child: Image.asset('assets/images/fulllogo.png'),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 40 / 896),
                    Container(
                      margin: EdgeInsets.only(left: 44),
                      child: Text(
                        'Enter your password!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF Pro Display',
                          color: Color(0xFF1D59A1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 40 / 896,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 44, right: 44),
                      width: 326,
                      child: TextFormField(
                        validator: (value) {
                          if (value == '') {
                            return 'This field is empty.';
                          } else {
                            return null;
                          }
                        },
                        controller: password,
                        keyboardType: TextInputType.emailAddress,
                        decoration: new InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFF1D59A1),
                          ),
                          hintText: 'New Password',
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
                      height: MediaQuery.of(context).size.height * 57 / 896 - 22,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 44, right: 44),
                      height: MediaQuery.of(context).size.height * 66 / 896,
                      width: 326,
                      child: FlatButton(
                        onPressed: () {
                          _data['email'] = email;
                          _data['otp'] = widget.otp;
                          _data['password'] = password.text;
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
                              "Reset Password",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
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
                      height: MediaQuery.of(context).size.height * 5 / 896,
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
