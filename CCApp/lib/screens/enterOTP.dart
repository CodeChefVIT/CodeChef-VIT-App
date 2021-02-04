import 'package:CCApp/screens/resetPassword.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Forgot Password'),
        backgroundColor: Color(0xFF1D59A1),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'An OTP has been sent to your registered email address.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Enter OTP',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 9 / 10,
            child: PinCodeTextField(
              appContext: context,
              length: 8,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldHeight: 60,
                fieldWidth: MediaQuery.of(context).size.width * 1 / 10,
                inactiveColor: Colors.black,
                inactiveFillColor: Colors.pink,
                selectedColor: Color(0xFF459AFF),
                activeColor: Colors.black,
              ),
              animationDuration: Duration(milliseconds: 300),
              controller: textEditingController,
              onCompleted: (v) {
                print(v);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResetPassword(
                      otp: v,
                    ),
                  ),
                );
              },
              onChanged: (value) {
                print(value);
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                return true;
              },
            ),
          ),
        ],
      ),
    );
  }
}
