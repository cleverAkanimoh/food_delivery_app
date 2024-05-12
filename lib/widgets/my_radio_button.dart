import 'package:flutter/material.dart';

class MyRadioButton extends StatelessWidget {
  const MyRadioButton({
    super.key,
    required this.fallbackColor,
    required this.activeColor,
    required this.isActive,
  });

  final Color fallbackColor;
  final Color activeColor;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(left: 5),
      height: 15,
      width: isActive ? 25 : 15,
      decoration: BoxDecoration(
        color: isActive ? activeColor : fallbackColor,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: isActive ? fallbackColor : activeColor,
        ),
      ),
    );
  }
}
