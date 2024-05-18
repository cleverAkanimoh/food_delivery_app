import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/home_button.dart';
import '../widgets/back_button.dart';
import '/models/restaurant.dart';
import '/widgets/cart_page/my_cart_tile.dart';
import '/widgets/my_button.dart';
import 'package:provider/provider.dart';

import 'payment_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // cart
        final userCart = restaurant.cart;

        // ui scaffold
        return Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        "Are you sure you want to clear all cart items?",
                      ),
                      actions: [
                        // cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        // yes button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text("Clear all"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              userCart.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: const Text("Your cart is empty"),
                            ),
                            const HomeButton(),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: userCart.length,
                                itemBuilder: (context, index) {
                                  // get individual cart item
                                  final cartItem = userCart[index];

                                  // cart tile ui
                                  return CartTile(cartItem: cartItem);
                                }),
                          ),
                          // show check if there is cart item if not show go to menu button
                          MyButton(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentPage(),
                              ),
                            ),
                            text: "Go to checkout",
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
