import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/notification_page.dart';
import 'package:food_delivery_app/widgets/category_page/my_current_location.dart';

import '../../services/auth/auth_service.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({super.key});

  final user = AuthService().getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                clipBehavior: Clip.hardEdge,
                children: [
                  Text(
                    "Hello, ${user!.displayName ?? "Username"}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
              MyCurrentLocation(),
            ],
          ),
          const SizedBox(width: 10),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const NotificationPage()),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 26,
                ),
                padding: const EdgeInsets.all(10),
              ),
              Positioned(
                  top: 10,
                  right: 15,
                  child: Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50)),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
