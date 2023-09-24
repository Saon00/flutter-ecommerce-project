import 'package:flutter/material.dart';

import '../utils/text_style.dart';

class ProductStepper extends StatefulWidget {
  const ProductStepper({super.key});

  @override
  State<ProductStepper> createState() => _ProductStepperState();
}

class _ProductStepperState extends State<ProductStepper> {
  var _currentValue = 0;
  final TextEditingController _stepperController =
      TextEditingController(text: '1');
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        // minus
        ElevatedButton(
          onPressed: () {
            if (_currentValue > 1) {
              _currentValue--;
              _stepperController.text = _currentValue.toString();
            }
          },
          child: const Icon(
            Icons.remove,
          ),
        ),

        // numbers
        SizedBox(
          width: 50,
          child: TextField(
            textAlign: TextAlign.center,
            controller: _stepperController,
            style: appbarTitleStyle,
            enabled: false,
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),

        // add
        ElevatedButton(
          onPressed: () {
            if (_currentValue < 20) {
              _currentValue++;
              _stepperController.text = _currentValue.toString();
            }
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
