import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/layout.dart';
import 'package:food_delivery_app/widgets/settings_page/logout_widget.dart';
import '/widgets/settings_page/settings_custom_tile.dart';
import '/widgets/settings_page/dark_mode_list_tile.dart';
import '/widgets/settings_page/settings_header.dart';
import '/widgets/settings_page/settings_container.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SettingsHeader(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              SizedBox(height: 15),
              SettingsContainer(
                heading: "General",
                child: Column(
                  children: [
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'Profile',
                      icon: Icons.person,
                    ),
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'My Address',
                      icon: Icons.location_city_outlined,
                    ),
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'Language',
                      icon: Icons.language,
                      hasBorder: false,
                    ),
                  ],
                ),
              ),
              SettingsContainer(
                heading: "Promotional Activity",
                child: Column(
                  children: [
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'Coupon',
                      icon: Icons.book_online_outlined,
                    ),
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'Loyalty Points',
                      icon: Icons.stars_sharp,
                    ),
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'My Wallet',
                      icon: Icons.wallet,
                      hasBorder: false,
                    ),
                  ],
                ),
              ),
              SettingsContainer(
                heading: "Earnings",
                child: Column(
                  children: [
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'Refer & Earn',
                      icon: Icons.group_add_sharp,
                    ),
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'Join as a Delivery Man',
                      icon: Icons.motorcycle_sharp,
                    ),
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'Become a Vendor',
                      icon: Icons.language,
                      hasBorder: false,
                    ),
                  ],
                ),
              ),
              SettingsContainer(
                heading: "Help & Support",
                child: Column(
                  children: [
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'Live Chat',
                      icon: Icons.support_agent,
                    ),
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'Help & support',
                      icon: Icons.phone,
                    ),
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'About Us',
                      icon: Icons.info,
                    ),
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'Terms & Conditions',
                      icon: Icons.menu_book_rounded,
                    ),
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'Privacy Policy',
                      icon: Icons.menu_book_rounded,
                    ),
                    SettingsCustomTile(
                      moveTo: Layout(),
                      label: 'Refund Policy',
                      icon: Icons.currency_exchange,
                      hasBorder: false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: whiteSpace),
            ],
          ),
        ),
      ],
    );
  }
}
