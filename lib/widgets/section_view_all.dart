import 'package:flutter/material.dart';

class SectionViewAll extends StatelessWidget {
  const SectionViewAll({super.key, required this.heading, required this.onTap});
  final String? heading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading!,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                "View all",
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Icon(Icons.arrow_right)
            ],
          ),
        )
      ],
    );
  }
}
