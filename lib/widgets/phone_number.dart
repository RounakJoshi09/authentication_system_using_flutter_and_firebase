import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                countries: ['IND'],
                showDropdownIcon: false,
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MaterialButton(
                  minWidth: double.infinity,
                  child: Text('Continue',
                      style: (TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ))),
                  color: Color.fromARGB(255, 117, 0, 212),
                  textColor: Colors.white70,
                  onPressed: () {
                    _formKey.currentState?.validate();
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
