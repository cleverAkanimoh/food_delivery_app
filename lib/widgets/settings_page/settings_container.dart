import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            margin: const EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.15),
                    blurRadius: 8,
                    spreadRadius: 1,
                  )
                ]),
            child: child,
          ),
        ],
      ),
    );
  }
}
