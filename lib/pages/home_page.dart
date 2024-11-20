import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_current_location.dart';
import 'package:food_delivery_app/components/my_description.dart';
import 'package:food_delivery_app/components/my_drawer.dart';
import 'package:food_delivery_app/components/my_food_tile.dart';
import 'package:food_delivery_app/components/my_tab_bar.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/food_page.dart';
import 'package:food_delivery_app/pages/my_sliver_app_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //yesma food items category items anusar return garne
  List <Food> _filterMenuCategory(FoodCategory category, List<Food> fullMenu){
    return fullMenu.where((food)=> food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
  return FoodCategory.values.map((category) {

    // get category menu
    List<Food> categoryMenu = _filterMenuCategory(category, fullMenu);

    // Return the ListView for each category
    return ListView.builder(
      itemCount: categoryMenu.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {

        //to get individual food
        final food =categoryMenu[index];
        return MyFoodTile(
          food: food,
          onTap: ()=>Navigator.push(context,
          MaterialPageRoute(
            builder: (context)=>FoodPage(food: food),
            ),
          ),
          );
      },
    );
  }).toList(); // Ensure you return the list of widgets
}

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled)=> [
            MySliverAppBar(
              title:MyTabBar(
                tabController: _tabController ,
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),

                  //current location 
                 const MyCurrentLocation(),

                  //description box
                 const MyDescriptionBox(),
                ],
              ),
               ),
          ],
         body: Consumer<Restaurant> (
          builder: (context, restaurant , child)=> TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
         ),

        ),
    );
  }
}