import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'phone_number.dart';
import '../global.dart' as global;
import '../pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'resend_otp.dart';

class OTPPage extends StatelessWidget {
  @override
  final otpController = OtpFieldController();
  final Function changeCurrentState;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = "";
  OTPPage({required this.verificationId, required this.changeCurrentState});
  Widget build(BuildContext context) {
    void signInWithPhoneAuthCredential(
        PhoneAuthCredential phoneAuthCredential) async {
      try {
        final authCredential =
            await _auth.signInWithCredential(phoneAuthCredential);

        if (authCredential.user != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      } on FirebaseAuthException catch (e) {
        // TODO
      }
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 22, horizontal: 10),
      child: Column(
        children: [
          OTPTextField(
            length: 6,
            controller: otpController,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 40,
            fieldStyle: FieldStyle.box,
            style: TextStyle(fontSize: 20),
            otpFieldStyle: OtpFieldStyle(
              backgroundColor: Color.fromARGB(66, 14, 153, 247),
            ),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            onCompleted: (pin) async {
              print(pin);
              print(verificationId);
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationId, smsCode: pin);

              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            child: MaterialButton(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Text(
                  'VERIFY',
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    color: Colors.white,
                  ),
                ),
              ),
              color: Color.fromARGB(255, 6, 7, 122),
              textColor: Colors.white,
              onPressed: () async {},
            ),
          ),
          Card(
              child: Row(
            children: [
              Text('Didn\'t recieve code'),
              ResendOtp(changeCurrentState: changeCurrentState),
            ],
          ))
        ],
      ),
    );
  }
}
