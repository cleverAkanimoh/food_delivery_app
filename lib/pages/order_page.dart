import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/home_button.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Your orders will appear here"),
          HomeButton(),
        ],
      ),
    );
  }
}
