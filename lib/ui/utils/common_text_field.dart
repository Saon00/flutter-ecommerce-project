import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;

  const CommonTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: primaryColor)),
        hintText: hintText,
        hintStyle: GoogleFonts.ubuntu(color: greyColor),
        // border: const OutlineInputBorder(),
      ),
    );
  }
}
