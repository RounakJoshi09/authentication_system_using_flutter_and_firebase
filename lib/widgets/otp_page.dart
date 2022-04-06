import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OTPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 22, horizontal: 10),
      child: OTPTextField(
        length: 6,
        width: MediaQuery.of(context).size.width,
        fieldWidth: 40,
        fieldStyle: FieldStyle.box,
        style: TextStyle(fontSize: 20),
        otpFieldStyle: OtpFieldStyle(
          backgroundColor: Color.fromARGB(66, 14, 153, 247),
        ),
        textFieldAlignment: MainAxisAlignment.spaceAround,
        onCompleted: (pin) {
          print("Completed: " + pin);
        },
      ),
    );
  }
}
