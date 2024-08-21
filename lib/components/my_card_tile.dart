import 'package:eat_faster/components/my_quantity.dart';
import 'package:eat_faster/models/card_item.dart';
import 'package:eat_faster/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCardTile extends StatelessWidget {
  final CardItem cardItem;
  const MyCardTile({super.key, required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "lib/${cardItem.food.imagePath}",
                      height: 100,
                    ),
                  ),

                  SizedBox(width: 10),

                  //name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(cardItem.food.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .colorScheme
                                  .inversePrimary)),

                      //food price
                      Text("${cardItem.food.price}₺",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary))
                    ],
                  ),

                  const Spacer(),

                  //increment or decremant quantity
                  MyQuantity(
                    quantity: cardItem.quantity,
                    food: cardItem.food,
                    onDecrement: () {
                      restaurant.removeFromCard(cardItem);
                    },
                    onIncrement: () {
                      restaurant.addToCard(
                          cardItem.food, cardItem.selectedAddons);
                    },
                  )
                ],
              ),
            ),
            //addons
            SizedBox(
              height: cardItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                scrollDirection: Axis.horizontal,
                children: cardItem.selectedAddons
                    .map((addon) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary)),
                            labelStyle: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                            label: Row(
                              children: [
                                //addon name
                                Text(addon.name),
                                //addon price
                                Text("(${addon.price}₺)")
                              ],
                            ),
                            onSelected: (value) {},
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
