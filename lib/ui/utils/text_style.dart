import 'package:demo/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle titileStyle = GoogleFonts.poppins(
  fontSize: 24,
  color: blackColor,
);

TextStyle subTitileStyle = GoogleFonts.poppins(
  color: greyColor,
  letterSpacing: .6,
);

TextStyle popularItemTitleStyle = GoogleFonts.poppins(
  color: blackColor.withOpacity(0.4),
  fontWeight: FontWeight.w500,
  letterSpacing: .6,
);

TextStyle popularItemSubTitleStyle = GoogleFonts.poppins(
  color: primaryColor,
  fontWeight: FontWeight.w500,
  // letterSpacing: .6,
);

TextStyle ratingStyle = GoogleFonts.poppins(color: greyColor, fontSize: 12);
