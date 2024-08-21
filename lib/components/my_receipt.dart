import 'package:eat_faster/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Thank you for your order!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.inversePrimary),
                    borderRadius: BorderRadius.circular(8)),
                child: Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.displayCardReceipt(),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                )),
            SizedBox(height: 10),
            Text(
              "Thank you for your order!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ],
        ),
      ),
    );
  }
}
