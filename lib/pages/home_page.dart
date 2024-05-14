import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../widgets/home_page/categories.dart';
import '../widgets/home_page/featured_container.dart';
import '../widgets/home_page/home_header.dart';
import '../widgets/product_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _handleRefresh() async {
    return await Future.delayed(Durations.medium4);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        child: ListView(
          children: [
            HomeHeader(),
            const ProductCarousel(),
            const Categories(),
            FeaturedContainer(heading: "Featured products", viewAll: () {}),
            FeaturedContainer(heading: "Featured stores", viewAll: () {}),
          ],
        ),
      ),
    );
  }
}
