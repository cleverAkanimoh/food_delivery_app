import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

class SettingsContainer extends StatelessWidget {
  final Widget child;
  final String heading;
  const SettingsContainer({
    super.key,
    required this.child,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: smallWhiteSpace, horizontal: whiteSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              fontSize: paragraphSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: whiteSpace, vertical: smallWhiteSpace),
            margin: const EdgeInsets.only(top: extraSmallWhiteSpace),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(roundedMd),
                boxShadow: [
                  BoxShadow(
                    color: mainColor.withOpacity(shadowOpacity),
                    blurRadius: blurRadius,
                    spreadRadius: spreadRadius,
                  )
                ]),
            child: child,
          ),
        ],
      ),
    );
  }
}
