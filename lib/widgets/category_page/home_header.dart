import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Clever Akanimoh",
                style: TextStyle(
                  // fontFamily: "SchibstedGrotesk",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      "155 aka rd, uyo, Akwa ibom state",
                      style: TextStyle(
                        // fontFamily: "SchibstedGrotesk",
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 26,
                ),
                padding: const EdgeInsets.all(10),
              ),
              Positioned(
                  top: 10,
                  right: 15,
                  child: Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50)),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
