import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                ),
              ),
            ),
            const Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 100,
                ),
                Text('Version 1.04')
              ],
            )
          ],
        ),
      ),
    );
  }
}
