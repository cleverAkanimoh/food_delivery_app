// import 'package:collection/collection.dart';
// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/models/gadgets/device.dart';
// import 'package:intl/intl.dart';

// import 'cart_item.dart';

// class Hardware extends ChangeNotifier {
//   final List<Device> _type = [
//     // burgers
//     Device(
//       name: "Classic Cheese Burger",
//       description:
//           "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle,",
//       imagePath: "assets/images/for_sale_1.avif",
//       price: 4.99,
//       category: DeviceCategory.systems,
//       availableAddons: [
//         DeviceAddon(name: "Charger", price: 3.99),
//       ],
//     ),
//   ];

//   // user cart
//   final List<CartItem> _cart = [];

// // G E T T E R S

//   List<Device> get type => _type;
//   List<CartItem> get cart => _cart;

//   // O P E R A T I O N S

//   // add to cart

//   void addToCart(Device device, List<DeviceAddon> deviceAddons) {
//     // check if there is a cart item already existing with the same device and selected addons
//     CartItem? cartItem = _cart.firstWhereOrNull((item) {
//       // check if device are the same
//       bool isSameDevice = item.device == device;

//       // check if the list of selected addons are the same
//       bool isSameAddons =
//           const ListEquality().equals(item.deviceAddons, deviceAddons);

//       return isSameDevice && isSameAddons;
//     });

//     // if item already exists, increase quantity
//     if (cartItem != null) {
//       cartItem.quantity++;
//     }

//     // otherwise add new
//     else {
//       _cart.add(
//         CartItem(
//           device: device,
//           deviceAddons: deviceAddons,
//         ),
//       );
//     }

//     notifyListeners();
//   }

//   // remove from cart
//   void removeFromCart(CartItem cartItem) {
//     int cartIndex = _cart.indexOf(cartItem);

//     if (cartIndex != -1) {
//       if (_cart[cartIndex].quantity > 1) {
//         _cart[cartIndex].quantity--;
//       } else {
//         _cart.removeAt(cartIndex);
//       }
//     }
//     notifyListeners();
//   }

//   // get total price
//   double getTotalPrice() {
//     double total = 0.00;
//     for (CartItem cartItem in _cart) {
//       double itemTotal = cartItem.food.price;
//       for (DeviceAddon addon in cartItem.deviceAddons) {
//         itemTotal += addon.price;
//       }
//       total += itemTotal * cartItem.quantity;
//     }

//     return total;
//   }

//   // get total items in cart
//   int getTotalItemCount() {
//     int totalItemCount = 0;

//     for (CartItem cartItem in _cart) {
//       totalItemCount += cartItem.quantity;
//     }
//     return totalItemCount;
//   }

//   // clear cart
//   void clearCart() {
//     _cart.clear();
//     notifyListeners();
//   }

//   // H E L P E R S

//   // generate a receipt
//   String displayCartReceipt() {
//     final receipt = StringBuffer();
//     receipt.writeln("Here's your receipt");
//     receipt.writeln();

//     // format the date to include up to second only
//     String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(
//       DateTime.now(),
//     );

//     receipt.writeln(formattedDate);
//     receipt.writeln();
//     receipt.writeln("---------------");

//     for (final cartItem in _cart) {
//       receipt.writeln(
//         "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}",
//       );
//       if (cartItem.deviceAddons.isNotEmpty) {
//         receipt.writeln(
//           "     Add-ons: ${_formatAddons(cartItem.deviceAddons)}",
//         );
//       }
//       receipt.writeln();
//     }
//     receipt.writeln("---------------");
//     receipt.writeln();
//     receipt.writeln("Total Items: ${getTotalItemCount()}");
//     receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
//     receipt.writeln();
//     // receipt.writeln("Delivering to $deliveryAddress");

//     return receipt.toString();
//   }

//   // format double value to money
//   String _formatPrice(double price) {
//     return "\$${price.toStringAsFixed(2)}";
//   }

//   // format list of addons to string summary
//   String _formatAddons(List<DeviceAddon> addons) {
//     return addons
//         .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
//         .join(", ");
//   }
// }
