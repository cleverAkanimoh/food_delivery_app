import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/pages/profile_page.dart';
import 'package:food_delivery_app/pages/settings_page.dart';

import '../../services/auth/auth_service.dart';

class SettingsHeader extends StatelessWidget {
  SettingsHeader({
    super.key,
  });

  final user = AuthService().getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(smallWhiteSpace),
      height: 170,
      color: mainColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            ),
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.vertical,
              children: [
                user!.photoURL != null
                    ? SizedBox(
                        width: largeWhiteSpace,
                        child: Image.network(user?.photoURL ?? ""),
                      )
                    : const Icon(
                        Icons.person,
                        size: largeWhiteSpace,
                        color: Colors.white,
                      ),
                const SizedBox(height: extraSmallWhiteSpace),
                Padding(
                  padding: const EdgeInsets.only(
                    left: smallWhiteSpace,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        user!.displayName ?? "Username",
                        style: const TextStyle(
                          fontSize: paragraphSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: user!.email ?? "user email",
                          style: TextStyle(
                            fontSize: smallSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(.5),
                          ),
                          children: [
                            TextSpan(
                              text:
                                  " (${user!.emailVerified ? "verified" : "unverified"})",
                              style: TextStyle(
                                color: user!.emailVerified
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const SettingsPage()),
              ),
            ),
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
