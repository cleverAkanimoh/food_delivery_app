import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/pages/settings_page.dart';

import '../../services/auth/auth_service.dart';
import '../colored_container.dart';

class SettingsHeader extends StatelessWidget {
  final bool? hasSettings;
  SettingsHeader({super.key, this.hasSettings = true});

  final user = AuthService().getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: smallWhiteSpace,
          vertical: hasSettings! ? smallWhiteSpace : 0),
      height: hasSettings! ? MediaQuery.of(context).size.height * 0.30 : null,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: largeWhiteSpace,
                height: largeWhiteSpace,
                child: user!.photoURL != null
                    ? Image.network(user?.photoURL ?? "")
                    : Icon(
                        Icons.person,
                        size: largeWhiteSpace,
                        color: Theme.of(context).colorScheme.primary,
                      ),
              ),
              const SizedBox(height: extraSmallWhiteSpace),
              Column(
                children: [
                  Text(
                    "Clever Akanimoh",
                    style: TextStyle(
                      fontSize: headingSize,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(height: smallWhiteSpace),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ColoredContainer(
                        child: Text(
                          "@KingCrush",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: extraSmallWhiteSpace),
                      ColoredContainer(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.card_giftcard,
                              size: headingSize,
                            ),
                            const SizedBox(width: extraSmallWhiteSpace),
                            Text(
                              "20 orders",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: extraSmallWhiteSpace),
                      const ColoredContainer(
                        color: mainColor,
                        child: Row(
                          children: [
                            Text(
                              "254",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.hotel_class,
                              size: headingSize,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Positioned(
            top: extraSmallWhiteSpace,
            right: 0,
            child: hasSettings!
                ? Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(shadowOpacity),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const SettingsPage()),
                        ),
                      ),
                      icon: const Icon(
                        Icons.settings,
                        color: mainColor,
                      ),
                    ),
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
