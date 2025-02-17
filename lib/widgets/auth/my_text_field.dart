import 'package:flutter/material.dart';

import '../../constants.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: extraSmallWhiteSpace, horizontal: whiteSpace),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(smallWhiteSpace),
          prefixIcon: Icon(icon),
          prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(roundedFull),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: mainColor.withOpacity(shadowOpacityMd),
            ),
            borderRadius: BorderRadius.circular(roundedFull),
          ),
        ),
      ),
    );
  }
}
