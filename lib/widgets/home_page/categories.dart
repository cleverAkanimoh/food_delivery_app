import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/category_page.dart';

import '../../constants.dart';

class Categories extends StatefulWidget {
  const Categories({
    super.key,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: smallWhiteSpace,
        horizontal: whiteSpace,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          categoryButton(
            "gadget",
            "assets/map/pin_red.jpg",
            const CategoryPage(category: "Gadget"),
          ),
          categoryButton(
            "meals",
            "assets/map/pin_blue.jpg",
            const CategoryPage(category: "Meals"),
          ),
          categoryButton(
            "delivery",
            "assets/images/delivery.png",
            const CategoryPage(category: "Delivery"),
          ),
        ],
      ),
    );
  }

  GestureDetector categoryButton(String title, String imageSrc, Widget moveTo) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => moveTo,
            ));
      },
      child: Column(
        children: [
          Image.asset(
            imageSrc,
            width: 60,
          ),
          const SizedBox(height: smallWhiteSpace),
          Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: paragraphSize,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
