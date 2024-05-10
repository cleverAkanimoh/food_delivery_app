import 'package:flutter/material.dart';
import 'pages/favorite_page.dart';
import 'pages/order_page.dart';
import 'pages/settings_page.dart';
import 'pages/cart_page.dart';
import 'pages/home_page.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (currentPage) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const FavoritePage();
        break;
      case 2:
        page = const OrderPage();
        break;
      case 3:
        page = const SettingsPage();
        break;
      default:
        throw UnimplementedError('no widget for $currentPage');
    }

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: page,
      ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar on narrow screens.
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomAppBar(
                    height: 90,
                    padding: const EdgeInsets.only(
                        left: 20, top: 1, right: 20, bottom: 20),
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appBarItem(
                            0,
                            "Home",
                            Icons.home_outlined,
                            Icons.home,
                          ),
                          appBarItem(
                            1,
                            "Favorites",
                            Icons.favorite_outline_outlined,
                            Icons.favorite,
                          ),
                          Transform.translate(
                            offset: const Offset(0, -16),
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 5,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.15),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0, -5),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CartPage(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Theme.of(context).colorScheme.tertiary,
                                  size: 28,
                                ),
                              ),
                            ),
                          ),
                          appBarItem(
                            2,
                            "Order",
                            Icons.library_books_outlined,
                            Icons.library_books,
                          ),
                          appBarItem(
                            3,
                            "Menu",
                            Icons.menu,
                            Icons.settings,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      navRailItem(
                        "Home",
                        const Icon(Icons.home_outlined),
                        const Icon(Icons.home_filled),
                      ),
                      navRailItem(
                        "Favorites",
                        const Icon(Icons.favorite_outline_outlined),
                        const Icon(Icons.favorite),
                      ),
                      navRailItem(
                        "Orders",
                        const Icon(Icons.library_books_outlined),
                        const Icon(Icons.library_books),
                      ),
                      navRailItem(
                        "Menu",
                        const Icon(Icons.menu),
                        const Icon(Icons.settings),
                      ),
                      navRailItem(
                        "Cart",
                        const Icon(Icons.shopping_cart_outlined),
                      ),
                    ],
                    selectedIndex: currentPage,
                    onDestinationSelected: (index) {
                      if (index == 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ),
                        );
                        return;
                      }
                      setState(
                        () {
                          currentPage = index;
                        },
                      );
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }

  NavigationRailDestination navRailItem(String label, Widget icon,
      [Widget? activeIcon]) {
    return NavigationRailDestination(
      icon: icon,
      label: Text(label),
      selectedIcon: activeIcon,
    );
  }

  GestureDetector appBarItem(int index, String label, IconData icon,
      [IconData? activeIcon]) {
    var inversePrimaryColor = Theme.of(context).colorScheme.inversePrimary;
    var primaryColor = Theme.of(context).colorScheme.primary;
    return GestureDetector(
      onTap: () {
        setState(
          () {
            currentPage = index;
          },
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            currentPage != index ? icon : activeIcon,
            size: 24,
            color: currentPage == index ? inversePrimaryColor : primaryColor,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: currentPage == index ? inversePrimaryColor : primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
