import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final IconData iconData;
  final VoidCallback callback;
  const AppBarIcon({
    super.key,
    required this.iconData,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      onTap: callback,
      child: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey.shade100,
          child: Icon(
            iconData,
            color: Colors.grey,
          )),
    );
  }
}
