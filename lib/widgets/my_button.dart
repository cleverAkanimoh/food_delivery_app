import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: mainColor,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 4,
                  color: colorScheme.tertiary,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.25),
                    spreadRadius: 2,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_right_alt_rounded,
                size: 40,
                color: colorScheme.tertiary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
