import 'package:demo/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../utils/text_style.dart';

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
        stepperButton(() {
          if (_currentValue > 1) {
            _currentValue--;
            _stepperController.text = _currentValue.toString();
          }
        }, Icons.remove),

        // numbers
        SizedBox(
          width: 50,
          height: 30,
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
        stepperButton(() {
          if (_currentValue < 20) {
            _currentValue++;
            _stepperController.text = _currentValue.toString();
          }
        }, Icons.add),
      ],
    );
  }

  Widget stepperButton(VoidCallback ontap, IconData iconData) {
    return SizedBox(
      height: 40,
      width: 40,
      child: InkWell(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(8)),
          child: Icon(
            iconData,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
