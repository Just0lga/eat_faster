import 'package:eat_faster/components/my_receipt.dart';
import 'package:flutter/material.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

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
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Enjoy your meal!!!",
          style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: MyReceipt(),
    );
  }
}
