library authentication_system.global;

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

final TextEditingController phoneNumberController = new TextEditingController();
enum MobileVerificationState {
  ENTER_MOBILE_NUMBER_STATE,
  ENTER_OTP_STATE,
}
bool showLoading = false;
MobileVerificationState currentState =
    MobileVerificationState.ENTER_MOBILE_NUMBER_STATE;

void changeStateFunc() {
  showLoading = false;
  currentState = MobileVerificationState.ENTER_OTP_STATE;
}
