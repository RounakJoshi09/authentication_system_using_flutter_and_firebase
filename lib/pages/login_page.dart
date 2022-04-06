import 'package:flutter/material.dart';
import '../widgets/phone_number.dart';
import '../widgets/otp_page.dart';

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
  final phoneNumberController =
      TextEditingController(); //For taking input from the field
  final otpController =
      TextEditingController(); //For taking input from the field

  final currentState = MobileVerificationState.ENTER_OTP_STATE;
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
          PhoneNumber(phoneNumberController: phoneNumberController),
        ],
      ),
    );
  }

  enterOTPWidget(context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 250, left: 5, right: 5, bottom: 5),
              child: Text(
                'Verify Phone',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    fontFamily: 'RobotoMono'),
              )),
          Container(
            width: 180,
            margin: EdgeInsets.only(top: 5, bottom: 0),
            child: Text('Code is sent to ${phoneNumberController.text}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54)),
          ),
          OTPPage(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentState == MobileVerificationState.ENTER_MOBILE_NUMBER_STATE
          ? enterOTPWidget(context)
          : enterMobileNumberWidget(context),
    );
  }
}
