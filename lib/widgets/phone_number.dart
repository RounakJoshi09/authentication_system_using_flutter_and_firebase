import 'package:authentication_system/widgets/continue_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../global.dart' as global;
import 'phone_number_field.dart';
import 'continue_button.dart';
import 'resend_otp.dart';

class PhoneNumber extends StatelessWidget {
  //final TextEditingController phoneNumberController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final Function changeCurrentState;
  final Function showLoadingState;
  final Function notShowLoadingState;
  PhoneNumber(
      {required this.changeCurrentState,
      required this.showLoadingState,
      required this.notShowLoadingState});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhoneNumberField(),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          child: MaterialButton(
            child: ContinueButton(),
            color: Color.fromARGB(255, 6, 7, 122),
            textColor: Color.fromRGBO(255, 255, 255, 1),
            onPressed: () async {
              showLoadingState();

              print(global.phoneNumberController);

              await (_auth).verifyPhoneNumber(
                phoneNumber: '+91' + global.phoneNumberController.text,
                timeout: const Duration(seconds: 30),
                verificationCompleted: (PhoneAuthCredential) async {
                  notShowLoadingState();
                },
                verificationFailed: (verificationFailed) async {
                  notShowLoadingState();
                },
                codeSent: (verificationId, resendingToken) async {
                  changeCurrentState(verificationId);
                },
                codeAutoRetrievalTimeout: (verificationId) async {},
              );
            },
          ),
        ),
      ],
    );
  }
}
