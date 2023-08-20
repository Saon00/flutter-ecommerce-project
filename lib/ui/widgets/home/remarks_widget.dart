import 'package:demo/ui/utils/app_colors.dart';
import 'package:demo/ui/utils/text_style.dart';
import 'package:flutter/material.dart';

class RemarkWidget extends StatelessWidget {
  final String remarksName;
  final VoidCallback seeAllTap;

  const RemarkWidget(
      {super.key, required this.remarksName, required this.seeAllTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          remarksName,
          style: titileStyle.copyWith(
              fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: .6),
        ),
        TextButton(
            onPressed: seeAllTap,
            child: Text(
              'See all',
              style: subTitileStyle.copyWith(color: primaryColor),
            )),
      ],
    );
  }
}
