import 'package:flutter/material.dart';

import '../constants.dart';

class ColoredContainer extends StatelessWidget {
  final Color? color;
  final Widget child;

  const ColoredContainer({
    super.key,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: smallWhiteSpace,
        vertical: extraSmallWhiteSpace,
      ),
      decoration: BoxDecoration(
        color: color ??
            Theme.of(context).colorScheme.primary.withOpacity(shadowOpacityMd),
        borderRadius: BorderRadius.circular(roundedFull),
      ),
      child: child,
    );
  }
}
