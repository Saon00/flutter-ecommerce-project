import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final int? maxlines;
  final Function(String?) validator;

  const CommonTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.maxlines,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validator(value);
      },
      cursorColor: primaryColor,
      maxLines: maxlines,
      controller: textEditingController,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: primaryColor)),
        hintText: hintText,
        hintStyle: GoogleFonts.ubuntu(color: greyColor),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
