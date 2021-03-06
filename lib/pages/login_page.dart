import 'package:flutter/material.dart';
import '../widgets/phone_number.dart';
import '../widgets/otp_page.dart';
import '../global.dart' as global;
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

enum MobileVerificationState {
  ENTER_MOBILE_NUMBER_STATE,
  ENTER_OTP_STATE,
}

class _LoginPageState extends State<LoginPage> {
  bool showLoading = false;
  MobileVerificationState currentState =
      MobileVerificationState.ENTER_MOBILE_NUMBER_STATE;

  final phoneNumberController =
      TextEditingController(); //For taking input from the field
  final otpController =
      TextEditingController(); //For taking input from the field

  void showLoadingState() {
    setState(() {
      showLoading = true;
    });
  }

  void notShowLoadingState() {
    setState(() {
      showLoading = false;
    });
  }

  String verificationId = "";
  void changeCurrentState(String verificationId) {
    this.verificationId = verificationId;
    setState(() {
      showLoading = false;
      currentState = MobileVerificationState.ENTER_OTP_STATE;
    });
  }

  enterMobileNumberWidget(context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 5),
              margin: EdgeInsets.only(top: 250, left: 5, right: 5, bottom: 2),
              child: Text('Please Enter Your Mobile Number',
                  style: GoogleFonts.roboto(
                    color: Colors.black87,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ))),
          Container(
            width: 180,
            padding: EdgeInsets.only(bottom: 15),
            child: Text('You\'ll receive a 6 digit code to verify next',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54)),
          ),
          PhoneNumber(
              changeCurrentState: changeCurrentState,
              showLoadingState: showLoadingState,
              notShowLoadingState: notShowLoadingState),
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
                style: GoogleFonts.roboto(
                  color: Colors.black87,
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                ),
              )),
          Container(
            width: 180,
            margin: EdgeInsets.only(top: 5, bottom: 0),
            child: Text('Code is sent to ${global.phoneNumberController.text}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54)),
          ),
          OTPPage(
              verificationId: verificationId,
              changeCurrentState: changeCurrentState),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: showLoading == true
          ? Center(child: CircularProgressIndicator())
          : currentState == MobileVerificationState.ENTER_MOBILE_NUMBER_STATE
              ? enterMobileNumberWidget(context)
              : enterOTPWidget(context),
    ));
  }
}
