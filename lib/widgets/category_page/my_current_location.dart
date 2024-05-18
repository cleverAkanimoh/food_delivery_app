import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/pages/map_page.dart';
import '/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});
  final TextEditingController textController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your location"),
        content: TextField(
          decoration: const InputDecoration(hintText: "Enter address"),
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              String newAddress = textController.text;
              context.read<Restaurant>().updateDeliveryAddress(newAddress);
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // openLocationSearchBox(context)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MapPage(),
          ),
        );
      },
      child: Row(
        children: [
          Consumer<Restaurant>(builder: (context, restaurant, child) {
            return Text(
              restaurant.deliveryAddress,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: smallSize,
              ),
            );
          }),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Theme.of(context).colorScheme.primary,
          )
        ],
      ),
    );
  }
}
