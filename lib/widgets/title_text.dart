import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: headingSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
