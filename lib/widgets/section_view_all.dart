import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

class SectionViewAll extends StatelessWidget {
  const SectionViewAll({super.key, required this.heading, required this.onTap});
  final String? heading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: whiteSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading!,
            style: TextStyle(
              fontSize: headingSize,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Row(
              children: [
                Text(
                  "View all",
                  style: TextStyle(
                    fontSize: 12,
                    color: mainColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          )
        ],
      ),
    );
  }
}
