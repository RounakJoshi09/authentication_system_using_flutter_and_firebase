import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumber extends StatelessWidget {
  final phoneNumberController;
  FirebaseAuth _auth = FirebaseAuth.instance;
  PhoneNumber({this.phoneNumberController});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: IntlPhoneField(
            controller: phoneNumberController,
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
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
