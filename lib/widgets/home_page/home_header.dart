import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/pages/notification_page.dart';
import 'package:food_delivery_app/widgets/category_page/my_current_location.dart';

import '../../services/auth/auth_service.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({super.key});

  final user = AuthService().getCurrentUser();
  // final userInfo = 

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(
          vertical: smallWhiteSpace, horizontal: whiteSpace),
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
          const SizedBox(width: smallWhiteSpace),
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
                icon: Icon(
                  Icons.notifications_outlined,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: emphasisText,
                ),
                padding: const EdgeInsets.all(10),
              ),
              Positioned(
                  top: 10,
                  right: 15,
                  child: Container(
                    height: 5,
                    width: 5,
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
