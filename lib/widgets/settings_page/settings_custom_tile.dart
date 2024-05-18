import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

class SettingsCustomTile extends StatelessWidget {
  final Widget moveTo;
  final String label;
  final IconData icon;
  final bool? hasBorder;

  const SettingsCustomTile({
    super.key,
    required this.moveTo,
    required this.label,
    required this.icon,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => moveTo),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: smallWhiteSpace,
        ),
        decoration: BoxDecoration(
          border: hasBorder!
              ? Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.background,
                  ),
                )
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
            ),
            const SizedBox(width: smallWhiteSpace),
            Text(
              label,
              style: const TextStyle(
                fontSize: paragraphSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
