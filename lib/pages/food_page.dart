import 'package:eat_faster/components/my_button.dart';
import 'package:eat_faster/models/food.dart';
import 'package:flutter/material.dart';
import 'package:eat_faster/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  FoodPage({super.key, required this.food}) {
    //initialize selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //method to add to card
  void addToCard(Food food, Map<Addon, bool> selectedAddons) {
    //close the current food page to go back to menu
    Navigator.pop(context);
    //format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    //add to card
    context.read<Restaurant>().addToCard(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //Scaffold UI
      Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            //food image
            Image.asset(
              "lib/${widget.food.imagePath}",
            ),

            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //food name
                  Text(
                    widget.food.name,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),

                  //food price
                  Text(
                    "${widget.food.price}₺",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),

                  const SizedBox(height: 10),

                  //food description
                  Text(
                    widget.food.description,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Divider(color: Theme.of(context).colorScheme.secondary),
                  Text("Add-ons",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),

                  Divider(color: Theme.of(context).colorScheme.secondary),
                  //food addons
                  ListView.builder(
                    itemCount: widget.food.availableAddons.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      //get addons
                      Addon addon = widget.food.availableAddons[index];
                      return Column(children: [
                        CheckboxListTile(
                          title: Text(
                            addon.name,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                          ),
                          subtitle: Text(
                            "${addon.price.toString()}₺",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                          ),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });
                          },
                        ),
                        Divider(color: Theme.of(context).colorScheme.secondary),
                      ]);
                    },
                  ),
                  SizedBox(height: 20),
                  MyButton(
                      onTap: () {
                        print("KKK${widget.food}");
                        addToCard(widget.food, widget.selectedAddons);
                      },
                      text: "Add to Card")
                ],
              ),
            )
          ],
        ),
      )),
      //Back Button
      SafeArea(
        child: Opacity(
          opacity: 0.7,
          child: Container(
            margin: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle),
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_sharp,
                    color: Theme.of(context).colorScheme.inversePrimary)),
          ),
        ),
      )
    ]);
  }
}
