import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

final kHintTextStyle = GoogleFonts.changa(
  color: Colors.white54,
);

final kLabelStyle = GoogleFonts.changa(
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
final kTitleStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
  fontSize: 26.0,
  height: 1.5,
);

final kSubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  height: 1.2,
);
