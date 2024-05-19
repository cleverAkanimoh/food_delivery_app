import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final bool isLoading;

  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: whiteSpace),
      padding: const EdgeInsets.only(left: smallWhiteSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: paragraphSize,
              color: colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: isLoading ? null : onTap,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: isLoading ? mainColor.shade200 : mainColor,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 5,
                  color: colorScheme.tertiary,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(shadowOpacity),
                    spreadRadius: 2,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: isLoading
                  ? CupertinoActivityIndicator(
                      color: colorScheme.tertiary,
                    )
                  : Icon(
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
