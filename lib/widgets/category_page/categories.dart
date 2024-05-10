import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              categoryButton(
                "Gadget",
                Icons.laptop_chromebook,
                () {},
              ),
              categoryButton(
                "Meals",
                Icons.fastfood,
                () {},
              ),
              categoryButton(
                "Delivery",
                Icons.motorcycle,
                () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  GestureDetector categoryButton(
      String title, IconData icon, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.87,
        height: 100,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(128, 189, 189, 189),
                blurRadius: 4,
                spreadRadius: 4,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 35,
            ),
            const SizedBox(height: 5),
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
      ),
    );
  }
}
