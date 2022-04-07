import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../global.dart' as global;

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
