import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import '/models/restaurant.dart';
import '/services/database/firestore.dart';
import 'package:provider/provider.dart';
import '/widgets/delivery_page/receipt.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  // get access to the database
  FireStoreService db = FireStoreService();

  @override
  void initState() {
    super.initState();

    // if we reach this page let's submit the order to the database
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery in progress..."),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              const Receipt(),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => const HomePage(),
                  ),
                ),
                child: const Text("Go back Home"),
              )
            ],
          )),
        ],
      ),
    );
  }
}

Widget _buildBottomNavBar(BuildContext context) {
  return Container(
    height: 100,
    padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ),

        const SizedBox(width: 10),

        // user details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Clever A.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Text(
              "Rider",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        const Spacer(),

        Row(
          children: [
            // message button
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.message),
                color: Theme.of(context).colorScheme.primary,
                onPressed: () {},
              ),
            ),

            const SizedBox(width: 10),

            // call button
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.call),
                color: Colors.green,
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    ),
  );
}
