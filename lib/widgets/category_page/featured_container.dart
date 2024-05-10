import 'package:flutter/material.dart';
import '../section_view_all.dart';

class FeaturedContainer extends StatefulWidget {
  const FeaturedContainer({
    super.key,
  });

  @override
  State<FeaturedContainer> createState() => _FeaturedContainerState();
}

class _FeaturedContainerState extends State<FeaturedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Column(
        children: [
          SectionViewAll(
            heading: "Featured products",
            onTap: () {},
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  featuredCard("Iphone 6s", 80000, 2),
                  featuredCard("Hp Inspiron 15", 100000, 5),
                  featuredCard("Iphone 11", 350000, 4),
                  featuredCard("Dell Latitude E7470", 300000, 8),
                  featuredCard("Apple Airpods", 350000, 2),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container featuredCard(String title, int price, int left) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                right: 2,
                top: 2,
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.favorite_outline,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24,
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: Color.fromARGB(42, 238, 238, 238),
                    borderRadius: BorderRadius.circular(15)),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "NGN$price ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                          text: "$left units left",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
