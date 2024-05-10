import 'package:flutter/material.dart';
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
        page = const Scaffold();
        break;
      case 2:
        page = const Scaffold();
        break;
      case 3:
        page = const Scaffold();
        break;
      // case 4:
      //   page = const CartPage();
      //   break;
      default:
        throw UnimplementedError('no widget for $currentPage');
    }

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: page,
      ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on narrow screens.
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomAppBar(
                    height: 90,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                              // border: Border.all(
                              //   color: Theme.of(context).colorScheme.background,
                              //   width: 10,
                              // ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  spreadRadius: 7,
                                  blurRadius: 10,
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
                            Icons.person,
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
                        const Icon(Icons.person),
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
            size: 26,
            color: currentPage == index ? Colors.red : Colors.black,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: currentPage == index
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.inversePrimary,
            ),
          )
        ],
      ),
    );
  }
}
