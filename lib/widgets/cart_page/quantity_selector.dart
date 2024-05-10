import 'package:flutter/material.dart';
import '../../models/meals/food.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.food,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // decrease quantity
          GestureDetector(
            onTap: onDecrement,
            child: Icon(
              Icons.remove,
              size: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          // value
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 25,
              child: Center(
                child: Text(
                  quantity.toString(),
                ),
              ),
            ),
          ),
          // decrease quantity
          GestureDetector(
            onTap: onIncrement,
            child: Icon(
              Icons.add,
              size: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
