import 'package:eat_faster/components/my_button.dart';
import 'package:eat_faster/components/my_card_tile.dart';
import 'package:eat_faster/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eat_faster/models/restaurant.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //card info
        final userCard = restaurant.card;

        //Scaffold UI
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon:
                  Icon(Icons.arrow_back_ios), // Different icon for back button
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            iconTheme: IconThemeData(
                color: Theme.of(context).colorScheme.inversePrimary),
            title: Text("Card", style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            //clear card button
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          "Are you sure you want to clear the card?",
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                restaurant.clearCard();
                              },
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ))
                        ],
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ))
            ],
          ),
          body: Column(
            children: [
              //list of card
              Expanded(
                child: Column(
                  children: [
                    userCard.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Text(
                                "Card is empty...",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                                itemCount: userCard.length,
                                itemBuilder: (context, index) {
                                  //get individual card item
                                  final cardItem = userCard[index];

                                  //return card tile UI
                                  return MyCardTile(cardItem: cardItem);
                                }))
                  ],
                ),
              ),
              //button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MyButton(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(),
                        )),
                    text: "Go to checkout"),
              ),
              SizedBox(height: 25)
            ],
          ),
        );
      },
    );
  }
}
