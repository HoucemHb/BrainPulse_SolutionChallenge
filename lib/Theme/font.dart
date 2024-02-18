import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppFonts {
  static final headLine = GoogleFonts.urbanist(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w900,
    letterSpacing: -0.01,
  );
  static final mainButtonsFont = GoogleFonts.urbanist(
      fontSize: 18,
      fontWeight: FontWeight.w900,
      color: Colors.white,
      letterSpacing: -0.004);
}
