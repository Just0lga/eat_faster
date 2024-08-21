import 'dart:ui';

import 'package:eat_faster/components/my_button.dart';
import 'package:eat_faster/pages/delivery_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  //credit card item
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;

  //user wants to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                title: Text(
                  "Confirm Payment",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold),
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text(
                        "Card Number: $cardNumber",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      Text(
                        "Expiry Date: $expiryDate",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      Text(
                        "Card Holder Name: $cardHolderName",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      Text(
                        "CVV: $cvvCode",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      )
                    ],
                  ),
                ),
                actions: [
                  //cancel button
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      )),

                  //Progress button
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeliveryProgressPage()));
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios), // Different icon for back button
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.inversePrimary),
          title: Text(
            "Checkout",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: ListView(
        children: [
          //credit card
          CreditCardWidget(
            cardBgColor: Theme.of(context).colorScheme.inversePrimary,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),

          //credit card form
          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: formKey),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyButton(onTap: userTappedPay, text: "Pay Now"),
          ),

          SizedBox(height: 25)
        ],
      ),
    );
  }
}
