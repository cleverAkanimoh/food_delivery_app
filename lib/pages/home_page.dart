import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/widgets/auth/my_text_field.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../widgets/home_page/categories.dart';
import '../widgets/home_page/featured_container.dart';
import '../widgets/home_page/home_header.dart';
import '../widgets/product_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _handleRefresh() async {
    return await Future.delayed(Durations.medium4);
  }

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        color: Theme.of(context).colorScheme.tertiary,
        backgroundColor: mainColor,
        child: ListView(
          children: [
            HomeHeader(),
            MyTextField(
                controller: searchController,
                hintText: "Search",
                obscureText: false,
                icon: Icons.format_list_bulleted_sharp),
            const Categories(),
            FeaturedContainer(heading: "Featured products", viewAll: () {}),
            const ProductCarousel(),
            FeaturedContainer(heading: "Featured stores", viewAll: () {}),
          ],
        ),
      ),
    );
  }
}
