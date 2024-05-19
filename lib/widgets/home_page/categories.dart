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
            "assets/images/gadget.jpg",
            const CategoryPage(category: "Gadget"),
          ),
          categoryButton(
            "meals",
            "assets/images/meals.jpg",
            const CategoryPage(category: "Meals"),
          ),
          categoryButton(
            "delivery",
            "assets/images/delivery.jpg",
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
          ClipRRect(
            borderRadius: BorderRadius.circular(roundedMd),
            child: Image.asset(
              imageSrc,
              width: 60,
              height: 60,
            ),
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
