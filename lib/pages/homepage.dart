import 'package:eat_faster/components/my_food_tile.dart';
import 'package:eat_faster/components/my_tab_bar.dart';
import 'package:eat_faster/models/food.dart';
import 'package:eat_faster/models/restaurant.dart';
import 'package:eat_faster/pages/card_page.dart';
import 'package:eat_faster/pages/food_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //sort out and return a list of food items that belong to a spesific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of foods in given category
  List<Widget> getFoodIThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map(
      (category) {
        List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
        return ListView.builder(
            itemCount: categoryMenu.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              //get individual food
              final food = categoryMenu[index];
              //return food tile UI
              return MyFoodTile(
                food: food,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodPage(food: food),
                    )),
              );
            });
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            "Tucco'ya Hoşgeldiniz",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: Consumer<Restaurant>(builder: (context, restaurant, child) {
            return Text(
              "${restaurant.getTotalPrice().toString()}₺",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            );
          }),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => Column(
            children: [
              Divider(
                color: Colors.white,
              ),
              MyTabBar(tabController: _tabController),
              Expanded(
                child: TabBarView(
                    controller: _tabController,
                    children: getFoodIThisCategory(restaurant.menu)),
              ),
            ],
          ),
        ));
  }
}
