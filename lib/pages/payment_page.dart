import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/pages/delivery_progress_page.dart';
import 'package:food_delivery_app/widgets/my_button.dart';

import '../widgets/back_button.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;

  // user wants to pay
  void userWantsToPay() {
    if (formKey.currentState!.validate()) {
      // only show dialog if form is valid
      showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text("Confirm Payment"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text("Card Number: $cardNumber"),
                    Text("Expiry Date: $expiryDate"),
                    Text("Card Holder Name: $cardHolderName"),
                    Text("CVV: $cvvCode"),
                  ],
                ),
              ),
              actions: [
                // cancel
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),

                // continue to delivery progress page
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => const DeliveryProgressPage(),
                      ),
                    );
                  },
                  child: const Text("Continue"),
                ),
              ],
            )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
        leading: const CustomBackButton(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // credit card
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  onCreditCardWidgetChange: (cardBrand) {},
                ),

                // Credit card Form
                CreditCardForm(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: (data) {
                    setState(() {
                      cardNumber = data.cardNumber;
                      cardHolderName = data.cardHolderName;
                      cvvCode = data.cvvCode;
                      expiryDate = data.expiryDate;
                    });
                  },
                  formKey: formKey,
                ),
              ],
            ),
          ),
          MyButton(onTap: userWantsToPay, text: "Make payment"),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
