import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

class MyDescriptionBox extends StatelessWidget {
  final double deliveryFee;
  final String deliveryTime;
  const MyDescriptionBox({
    super.key,
    required this.deliveryFee,
    required this.deliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var mySecondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary);
    return Container(
      padding: const EdgeInsets.all(whiteSpace),
      margin: const EdgeInsets.only(
        left: whiteSpace,
        right: whiteSpace,
        bottom: 40,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(roundedMd),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$$deliveryFee",
                style: myPrimaryTextStyle,
              ),
              Text(
                "Delivery fee",
                style: mySecondaryTextStyle,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                deliveryTime,
                style: myPrimaryTextStyle,
              ),
              Text(
                "Delivery time",
                style: mySecondaryTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
