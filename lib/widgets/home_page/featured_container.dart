import 'package:flutter/material.dart';
import '../section_view_all.dart';

class FeaturedContainer extends StatefulWidget {
  final String heading;
  final void Function()? viewAll;
  const FeaturedContainer({
    super.key,
    required this.heading,
    required this.viewAll,
  });

  @override
  State<FeaturedContainer> createState() => _FeaturedContainerState();
}

class _FeaturedContainerState extends State<FeaturedContainer> {
  // bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Column(
        children: [
          SectionViewAll(
            heading: widget.heading,
            onTap: widget.viewAll,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 280,
            child: Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  featuredCard(
                    "assets/images/for_sale_2.avif",
                    "Apple watch pro",
                    80000,
                    2,
                  ),
                  featuredCard(
                      "assets/images/gadget.avif", "Hp Inspiron 15", 100000, 5),
                  featuredCard(
                    "assets/images/for_sale_1.avif",
                    "Iphone 11",
                    350000,
                    4,
                  ),
                  featuredCard("assets/images/gadget.avif",
                      "Dell Latitude E7470", 300000, 8),
                  featuredCard(
                    "assets/images/for_sale_1.avif",
                    "Apple Airpods",
                    350000,
                    2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container featuredCard(
    String image,
    String title,
    int price,
    int left,
  ) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
              ),
            ),
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
                    text: "NGN $price ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                          text: "$left units left",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
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
