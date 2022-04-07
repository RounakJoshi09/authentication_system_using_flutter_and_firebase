import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../global.dart' as global;

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
        Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: IntlPhoneField(
            controller: global.phoneNumberController,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'IN',
            onChanged: (phone) {
              print(phone.completeNumber);
            },
            onTap: () => print(global.phoneNumberController),
            showDropdownIcon: false,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          child: MaterialButton(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Text(
                'CONTINUE',
                textScaleFactor: 1.5,
                style: TextStyle(fontFamily: 'RobotoMono', color: Colors.white),
              ),
            ),
            color: Color.fromARGB(255, 6, 7, 122),
            textColor: Colors.white,
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
                  // global.verificationId = verificationId;
                  // print(global.verificationId);
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
