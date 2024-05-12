import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/services/auth/login_or_register.dart';

import '../widgets/my_radio_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    var activeColor = Theme.of(context).colorScheme.primary;
    var fallbackColor = Colors.transparent;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentSlide = index;
                      });
                    },
                    enableInfiniteScroll: false,
                    disableCenter: true,
                    enlargeCenterPage: true,
                    initialPage: 0,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    autoPlayAnimationDuration: Durations.long4,
                    autoPlayInterval: const Duration(seconds: 10),
                    autoPlayCurve: Curves.linear,
                    viewportFraction: 1,
                  ),
                  items: [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Welcome page $i',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyRadioButton(
                    fallbackColor: fallbackColor,
                    activeColor: activeColor,
                    isActive: currentSlide == 0,
                  ),
                  MyRadioButton(
                    fallbackColor: fallbackColor,
                    activeColor: activeColor,
                    isActive: currentSlide == 1,
                  ),
                  MyRadioButton(
                    fallbackColor: fallbackColor,
                    activeColor: activeColor,
                    isActive: currentSlide == 2,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
