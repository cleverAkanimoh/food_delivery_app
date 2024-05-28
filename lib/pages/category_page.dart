import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import '../widgets/category_page/my_current_location.dart';
import '../widgets/category_page/my_description_box.dart';
import '../widgets/category_page/my_food_tile.dart';
import '../widgets/category_page/my_sliver_app_bar.dart';
import '../models/meals/food.dart';
import '/models/restaurant.dart';
import '/pages/food_page.dart';
import '/widgets/my_tab_bar.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  final String categoryHeading;
  final double deliveryFee;
  final String deliveryTime;
  const CategoryPage({
    super.key,
    required this.categoryHeading,
    required this.deliveryFee,
    required this.deliveryTime,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final food = categoryMenu[index];
            return MyFoodTile(
              food: food,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodPage(food: food),
                ),
              ),
            );
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            heading: widget.categoryHeading,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: whiteSpace),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: whiteSpace,
                    endIndent: whiteSpace,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  //  current location
                  Padding(
                    padding: const EdgeInsets.all(whiteSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Deliver here!",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: headingSize,
                          ),
                        ),
                        MyCurrentLocation(),
                      ],
                    ),
                  ),

                  // description box
                  MyDescriptionBox(
                    deliveryFee: widget.deliveryFee,
                    deliveryTime: widget.deliveryTime,
                  )
                ],
              ),
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
