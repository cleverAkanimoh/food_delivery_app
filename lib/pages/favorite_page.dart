import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/home_button.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text("You have no favorite"),
          ),
          const HomeButton(),
        ],
      ),
    );
  }
}
