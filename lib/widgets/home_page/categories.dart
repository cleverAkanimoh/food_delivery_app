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
            const CategoryPage(
              categoryHeading: "Gadget",
              deliveryTime: '15-40 minutes',
              deliveryFee: 9.9,
            ),
          ),
          categoryButton(
            "meals",
            "assets/images/products/meal_1.jpg",
            const CategoryPage(
              categoryHeading: "Meals",
              deliveryFee: 11.11,
              deliveryTime: "20-30 minutes",
            ),
          ),
          categoryButton(
            "delivery",
            "assets/images/delivery.jpg",
            const CategoryPage(
              categoryHeading: "Delivery",
              deliveryFee: 4.99,
              deliveryTime: "5-6 minutes",
            ),
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
              width: MediaQuery.of(context).size.width > smallMobileWidth
                  ? MediaQuery.of(context).size.width * 0.16
                  : MediaQuery.of(context).size.width * 0.265,
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
