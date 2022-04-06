import 'package:flutter/material.dart';
import '../widgets/phone_number.dart';

enum MobileVerificationState {
  ENTER_MOBILE_NUMBER_STATE,
  ENTER_OTP_STATE,
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final currentState = MobileVerificationState.ENTER_MOBILE_NUMBER_STATE;
  enterMobileNumberWidget(context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 250, left: 5, right: 5, bottom: 2),
              child: Text(
                'Please Enter Your Mobile Number',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    fontFamily: 'RobotoMono'),
              )),
          Container(
            width: 180,
            child: Text('You\'ll receive a 6 digit code to verify next',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54)),
          ),
          MyApp(),
        ],
      ),
    );
  }

  enterOTPWidget(context) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentState == MobileVerificationState.ENTER_MOBILE_NUMBER_STATE
          ? enterMobileNumberWidget(context)
          : enterOTPWidget(context),
    );
  }
}
