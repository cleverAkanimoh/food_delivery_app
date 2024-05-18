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
        children: [
          categoryButton(
            "gadget",
            "assets/map/pin_red.jpg",
            () {},
          ),
          categoryButton("meals", "assets/map/pin_blue.jpg", () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoryPage(
                    category: "meals",
                  ),
                ));
          }),
          categoryButton(
            "delivery",
            "assets/images/delivery.png",
            () {},
          ),
        ],
      ),
    );
  }

  GestureDetector categoryButton(
      String title, String imageSrc, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imageSrc,
            width: 50,
          ),
          const SizedBox(height: smallWhiteSpace),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
