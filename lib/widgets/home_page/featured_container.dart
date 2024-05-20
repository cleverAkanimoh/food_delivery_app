import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import '../section_view_all.dart';

class FeaturedContainer extends StatefulWidget {
  final String heading;
  final void Function()? viewAll;
  final List<dynamic>? productItem;
  const FeaturedContainer(
      {super.key,
      required this.heading,
      required this.viewAll,
      this.productItem});

  @override
  State<FeaturedContainer> createState() => _FeaturedContainerState();
}

class _FeaturedContainerState extends State<FeaturedContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: smallWhiteSpace),
      child: Column(
        children: [
          SectionViewAll(
            heading: widget.heading,
            onTap: widget.viewAll,
          ),
          const SizedBox(height: smallWhiteSpace),
          SizedBox(
            height: 270,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: whiteSpace),
                    scrollDirection: Axis.horizontal,
                    children: [
                      featuredCard(
                        "assets/images/products/wireless_airbud.jpg",
                        "Air Bud pro",
                        80000,
                        9,
                      ),
                      featuredCard(
                        "assets/images/products/headset.jpg",
                        "Lion Headset Bass",
                        50000,
                        5,
                      ),
                      featuredCard(
                        "assets/images/products/mac_book_1.jpg",
                        "Mac book 2019",
                        900000,
                        4,
                      ),
                      featuredCard(
                        "assets/images/products/iphone_11.jpg",
                        "Iphone 11",
                        300000,
                        8,
                      ),
                      featuredCard(
                        "assets/images/products/galaxy_a04s.jpg",
                        "Samsung galaxy A04s",
                        350000,
                        2,
                      ),
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

  Container featuredCard(
    String image,
    String title,
    int price,
    int left,
  ) {
    return Container(
      margin: const EdgeInsets.only(right: smallWhiteSpace),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(roundedMd)),
      child: Column(
        children: [
          SizedBox(
            height: 175,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(roundedMd),
              child: Image.asset(
                image,
                width: 150,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: extraSmallWhiteSpace, vertical: smallWhiteSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: headingSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "NGN $price ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: paragraphSize,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                          text: "$left units left",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: smallSize,
                            fontWeight: FontWeight.w300,
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
