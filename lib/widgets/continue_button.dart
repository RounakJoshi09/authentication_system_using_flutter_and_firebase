import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Text('CONTINUE',
          textScaleFactor: 1.5,
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w500)),
    );
  }
}
