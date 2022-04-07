import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../global.dart' as global;

class ResendOtp extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final Function changeCurrentState;
  ResendOtp({required this.changeCurrentState});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: () async {
            print(global.phoneNumberController);
            await (_auth).verifyPhoneNumber(
              phoneNumber: '+91' + global.phoneNumberController.text,
              timeout: const Duration(seconds: 30),
              verificationCompleted: (PhoneAuthCredential) async {},
              verificationFailed: (verificationFailed) async {},
              codeSent: (verificationId, resendingToken) async {
                // global.verificationId = verificationId;
                // print(global.verificationId);
                changeCurrentState(verificationId);
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
          child: Text('Request Again')),
    );
  }
}
