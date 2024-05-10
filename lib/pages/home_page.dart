import 'package:flutter/material.dart';
import '../widgets/home_page/categories.dart';
import '../widgets/home_page/featured_container.dart';
import '../widgets/home_page/home_header.dart';
import '../widgets/product_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const HomeHeader(),
          const ProductCarousel(),
          const Categories(),
          FeaturedContainer(
            heading: "Featured products",
            viewAll: () {},
          ),
          // FeaturedContainer(heading: "Featured stores", viewAll: () {}),
        ],
      ),
    );
  }
}
