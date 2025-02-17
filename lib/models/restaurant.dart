import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'cart_item.dart';
import 'meals/food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // burgers
    Food(
      name: "Classic Cheese Burger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle,",
      imagePath: "assets/images/products/meal_1.jpg",
      price: 4.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/products/meal_2.jpg",
      price: 4.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Grilled Onion", price: 0.99),
        Addon(name: "Jelapehos", price: 1.49),
        Addon(name: "Extra BBQ sauce", price: 1.99),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle,",
      imagePath: "assets/images/products/meal_3.jpg",
      price: 4.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Vegan Cheese", price: 0.99),
        Addon(name: "Grilled Mushroom", price: 1.99),
        Addon(name: "Humus Spread", price: 1.99),
      ],
    ),

    // Salads
    Food(
      name: "Ceasar Salad",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle,",
      imagePath: "assets/images/products/meal_4.jpg",
      price: 4.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 0.99),
        Addon(name: "Anchovies", price: 1.49),
        Addon(name: "Extra Parmesan", price: 1.99),
      ],
    ),
    Food(
      name: "Greek Salad",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/products/meal_1.jpg",
      price: 3.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Onion", price: 0.99),
        Addon(name: "Jelapehos", price: 1.49),
        Addon(name: "Extra BBQ sauce", price: 1.99),
      ],
    ),
    Food(
      name: "Quinoa Salad",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle,",
      imagePath: "assets/images/products/meal_2.jpg",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Avocado", price: 0.99),
        Addon(name: "Feta Cheese", price: 1.49),
        Addon(name: "Grilled Chicken", price: 1.99),
      ],
    ),

    // Sides

    Food(
      name: "Classic Cheese Burger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle,",
      imagePath: "assets/images/products/meal_3.jpg",
      price: 4.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/products/meal_4.jpg",
      price: 4.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Grilled Onion", price: 0.99),
        Addon(name: "Jelapehos", price: 1.49),
        Addon(name: "Extra BBQ sauce", price: 1.99),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle,",
      imagePath: "assets/images/products/meal_1.jpg",
      price: 4.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Vegan Cheese", price: 0.99),
        Addon(name: "Grilled Mushroom", price: 1.99),
        Addon(name: "Humus Spread", price: 1.99),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/products/meal_2.jpg",
      price: 4.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Grilled Onion", price: 0.99),
        Addon(name: "Jelapehos", price: 1.49),
        Addon(name: "Extra BBQ sauce", price: 1.99),
      ],
    ),

    // dessert

    Food(
      name: "Veggie Burger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle,",
      imagePath: "assets/images/products/meal_3.jpg",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Vegan Cheese", price: 0.99),
        Addon(name: "Grilled Mushroom", price: 1.99),
        Addon(name: "Humus Spread", price: 1.99),
      ],
    ),
    Food(
      name: "Classic Cheese Burger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle,",
      imagePath: "assets/images/products/meal_4.jpg",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/products/meal_1.jpg",
      price: 4.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Grilled Onion", price: 0.99),
        Addon(name: "Jelapehos", price: 1.49),
        Addon(name: "Extra BBQ sauce", price: 1.99),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle,",
      imagePath: "assets/images/products/meal_2.jpg",
      price: 4.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Vegan Cheese", price: 0.99),
        Addon(name: "Grilled Mushroom", price: 1.99),
        Addon(name: "Humus Spread", price: 1.99),
      ],
    ),
    // drinks
    Food(
      name: "mojito",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle,",
      imagePath: "assets/images/products/classic_drink.jpg",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Coke",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/products/cocacola.jpg",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Grilled Onion", price: 0.99),
        Addon(name: "Jelapehos", price: 1.49),
        Addon(name: "Extra BBQ sauce", price: 1.99),
      ],
    ),
    Food(
      name: "cocktail",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle,",
      imagePath: "assets/images/products/cocktail.jpg",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Vegan Cheese", price: 0.99),
        Addon(name: "Grilled Mushroom", price: 1.99),
        Addon(name: "Humus Spread", price: 1.99),
      ],
    ),
    Food(
      name: "lemonade",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle,",
      imagePath: "assets/images/products/lemonade.jpg",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Vegan Cheese", price: 0.99),
        Addon(name: "Grilled Mushroom", price: 1.99),
        Addon(name: "Humus Spread", price: 1.99),
      ],
    ),
    Food(
      name: "luxury",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle,",
      imagePath: "assets/images/products/luxury_lemonade.jpg",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Vegan Cheese", price: 0.99),
        Addon(name: "Grilled Mushroom", price: 1.99),
        Addon(name: "Humus Spread", price: 1.99),
      ],
    ),
  ];

  // user cart
  final List<CartItem> _cart = [];

  // user Address
  String _deliveryAddress = "Uyo, Akwa Ibom State, Ng";

// G E T T E R S

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  // O P E R A T I O N S

  // add to cart

  void addToCart(Food food, List<Addon> selectedAddons) {
    // check if there is a cart item already existing with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if food are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if item already exists, increase quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise add new
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }

    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price
  double getTotalPrice() {
    double total = 0.00;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

// update address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  // H E L P E R S

  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();

    // format the date to include up to second only
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(
      DateTime.now(),
    );

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("---------------");

    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}",
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(
          "     Add-ons: ${_formatAddons(cartItem.selectedAddons)}",
        );
      }
      receipt.writeln();
    }
    receipt.writeln("---------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to $deliveryAddress");

    return receipt.toString();
  }

  // format double value to money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons to string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
