import 'package:collection/collection.dart';
import 'package:eat_faster/models/card_item.dart';
import 'package:eat_faster/models/food.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  //list of menu
  final List<Food> _menu = [
    //Et
    Food(
        name: "Biftek",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Et/biftek.jpg",
        price: 348.99,
        category: FoodCategory.Et,
        availableAddons: [
          Addon(name: "Ekstra Peynir", price: 17.99),
          Addon(name: "Ekstra Sos", price: 12.99)
        ]),
    Food(
        name: "Et Sulu",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Et/et_sulu.jpg",
        price: 249.99,
        category: FoodCategory.Et,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "İngiliz Usulu Et",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Et/ingiliz_usulu_et.jpg",
        price: 348.99,
        category: FoodCategory.Et,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Patates Pureli Et",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Et/patates_pureli_et.jpg",
        price: 348.99,
        category: FoodCategory.Et,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Pilav Ustu Biftek",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Et/pilav_ustu_biftek.jpg",
        price: 348.99,
        category: FoodCategory.Et,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    //Tavuk
    Food(
        name: "Kizarmis Tavuk",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Tavuk/kizarmis_tavuk.jpg",
        price: 249.99,
        category: FoodCategory.Tavuk,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Meksika Usulu Tavuk",
        description:
            "Tavuk butlarinin harika meksikadan gelmis soslarla birlesimiyle ortaya çikan harika bir lezzet.",
        imagePath: "images/Tavuk/meksika_usulu_tavuk.jpg",
        price: 249.99,
        category: FoodCategory.Tavuk,
        availableAddons: [
          Addon(name: "Ekstra Peynir", price: 17.99),
          Addon(name: "Ekstra sos", price: 9.99)
        ]),
    Food(
        name: "Tavuk Sis",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Tavuk/tavuk_sis.jpg",
        price: 249.99,
        category: FoodCategory.Tavuk,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Tavuklu Sandviç",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Tavuk/tavuklu_sandvic.jpg",
        price: 249.99,
        category: FoodCategory.Tavuk,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Turk Usulu Tavuk",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Tavuk/turk_usulu_tavuk.jpg",
        price: 249.99,
        category: FoodCategory.Tavuk,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),

    //Hamburger
    Food(
        name: "Balik Hamburger",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Hamburger/balik_hamburger.jpg",
        price: 249.99,
        category: FoodCategory.Hamburger,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Citir Tavuk Hamburger",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Hamburger/citir_tavuk_hamburger.jpg",
        price: 249.99,
        category: FoodCategory.Hamburger,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Double Klasik Hamburger",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Hamburger/double_klasik_hamburger.jpg",
        price: 249.99,
        category: FoodCategory.Hamburger,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Klasik Hamburger",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Hamburger/klasik_hamburger.jpg",
        price: 249.99,
        category: FoodCategory.Hamburger,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Siyak Ekmek Hamburger",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Hamburger/siyah_ekmek_hamburger.jpg",
        price: 249.99,
        category: FoodCategory.Hamburger,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),

    //Pizza
    Food(
        name: "Bol Malzeme Pizza",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Pizza/bol_malzeme_pizza.jpg",
        price: 249.99,
        category: FoodCategory.Pizza,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Italyan Usulu Pizza",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Pizza/italyan_usulu_pizza.jpg",
        price: 249.99,
        category: FoodCategory.Pizza,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Kavurmali Pizza",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Pizza/kavurmali_pizza.jpg",
        price: 249.99,
        category: FoodCategory.Pizza,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Klasik Pizza",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Pizza/klasik_pizza.jpg",
        price: 249.99,
        category: FoodCategory.Pizza,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Mantarli Pizza",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Pizza/mantarli_pizza.jpg",
        price: 249.99,
        category: FoodCategory.Pizza,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),

    //Tatli
    Food(
        name: "Balli Fistikli Dondurma",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Tatli/balli_fistikli_dondurma.jpg",
        price: 249.99,
        category: FoodCategory.Tatli,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Basic One",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Tatli/basic_one.jpg",
        price: 249.99,
        category: FoodCategory.Tatli,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Dondurmali Brownie",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Tatli/dondurmali_brownie.jpg",
        price: 249.99,
        category: FoodCategory.Tatli,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Macaron",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Tatli/macaron.jpg",
        price: 249.99,
        category: FoodCategory.Tatli,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),

    //Icecekler
    Food(
        name: "Americano",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Icecekler/americano.jpg",
        price: 249.99,
        category: FoodCategory.Icecekler,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Latte",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Icecekler/latte.jpg",
        price: 249.99,
        category: FoodCategory.Icecekler,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Türk Kahvesi",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Icecekler/turk_kahvesi.jpg",
        price: 249.99,
        category: FoodCategory.Icecekler,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Coca Cola",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Icecekler/coca_cola.jpg",
        price: 249.99,
        category: FoodCategory.Icecekler,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
    Food(
        name: "Coca Cola Light",
        description: "Dananin en güzel yerinden yapilmis, yagsiz bir biftek",
        imagePath: "images/Icecekler/coca_cola_light.jpg",
        price: 249.99,
        category: FoodCategory.Icecekler,
        availableAddons: [Addon(name: "Ekstra Peynir", price: 17.99)]),
  ];
  /*
  GETTERS
  */

  List<Food> get menu => _menu;
  List<CardItem> get card => _card;

  /*
  OPERATIONS
  */

  //user card
  final List<CardItem> _card = [];

  //add to card

  void addToCard(Food food, List<Addon> selectedAddons) {
    // See if there is a card item already with the same food and selected addons
    CardItem? cardItem = _card.firstWhereOrNull((item) {
      // Check if the food items are the same
      bool isSameFood = item.food == food;

      // Check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameAddons && isSameFood;
    });

    // If item already exists, increase its quantity
    if (cardItem != null) {
      cardItem.quantity++;
    }
    // Otherwise, add a new card item to the card
    else {
      _card.add(CardItem(food: food, selectedAddons: selectedAddons));
    }

    // Notify listeners to update the UI
    notifyListeners();
  }

  void removeFromCard(CardItem cardItem) {
    int cardIndex = _card.indexOf(cardItem);

    if (cardIndex != -1) {
      if (_card[cardIndex].quantity > 1) {
        _card[cardIndex].quantity--;
      } else {
        _card.removeAt(cardIndex);
      }
      // Notify listeners to update the UI
      notifyListeners();
    }
  }

  //get total price of card
  double getTotalPrice() {
    double total = 0;
    for (CardItem cardItem in _card) {
      double itemTotal = cardItem.food.price;
      for (Addon addon in cardItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cardItem.quantity;
    }
    return total;
  }

  //get total number of items in card
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CardItem cardItem in _card) {
      totalItemCount += cardItem.quantity;
    }
    return totalItemCount;
  }

  //clear card
  void clearCard() {
    _card.clear();
    notifyListeners();
  }

  /*
  HELPERS
  */

  //generate a receipt
  String displayCardReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate =
        DateFormat("yyyy-MM--dd HH:mm:ss").format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-----------------");

    for (final CardItem in _card) {
      receipt.writeln(
          "${CardItem.quantity} x ${CardItem.food.name} - ${formatPrice(CardItem.food.price)}");
      if (CardItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Add-ons: ${_formatAddons(CardItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("-----------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${formatPrice(getTotalPrice())}");
    return receipt.toString();
  }

  //format double value into money
  String formatPrice(double price) {
    return "${price.toStringAsFixed(2)}₺";
  }

  //format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name}(${formatPrice(addon.price)})")
        .join(", ");
  }
}
