import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'pages/favorite_page.dart';
import 'pages/order_page.dart';
import 'pages/menu_page.dart';
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
    var colorScheme = Theme.of(context).colorScheme;
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
        page = const MenuPage();
        break;
      default:
        throw UnimplementedError('no widget for $currentPage');
    }

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.background,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: page,
      ),
    );
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < mobileWidth) {
            // Use a more mobile-friendly layout with BottomNavigationBar on narrow screens.
            return Stack(
              children: [
                mainArea,
                Positioned(
                    bottom: 0,
                    width: MediaQuery.of(context).size.width,
                    child: BottomAppBar(
                      color: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      height: 80,
                      padding: const EdgeInsets.only(
                        left: smallWhiteSpace,
                        right: smallWhiteSpace,
                        bottom: smallWhiteSpace,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                            color: colorScheme.tertiary,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: mainColor.withOpacity(shadowOpacity),
                                spreadRadius: spreadRadius,
                                blurRadius: blurRadius,
                              ),
                            ]),
                        child: Row(
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
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 5,
                                    color: colorScheme.tertiary,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: mainColor
                                          .withOpacity(shadowOpacityMd),
                                      spreadRadius: spreadRadius,
                                      blurRadius: blurRadius,
                                      offset: const Offset(0, -2),
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
                                    color: colorScheme.tertiary,
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
                    ))
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
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: currentPage == index ? inversePrimaryColor : primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
