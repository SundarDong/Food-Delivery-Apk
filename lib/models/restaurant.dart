import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu

   final List<Food> _menu =[
    
    //burgers
  Food(
    name: "Classic Cheese Burger",
    descriptions: "A classic cheeseburger: juicy beef patty, melted cheese, fresh toppings, and soft bun—simple, savory perfection!",
    imagePath: "lib/images/burgers/burgerA.jpg",
    price: 320,
    category: FoodCategory.burgers,
    availableAddons: [
      Addon(name: "Extra cheese", price: 100),
      Addon(name: "Bacon", price: 110),
      Addon(name: "Avocado", price: 120),
    ],
  ),
  Food(
    name: "Veggie Burger",
    descriptions: "A healthy and delicious veggie patty with fresh vegetables and tasty sauces.",
    imagePath: "lib/images/burgers/burgerB.jpg",
    price: 280,
    category: FoodCategory.burgers,
    availableAddons: [
      Addon(name: "Extra cheese", price: 100),
      Addon(name: "Lettuce", price: 50),
    ],
  ),
  Food(
    name: "BBQ Bacon Burger",
    descriptions: "A juicy beef patty with crispy bacon and tangy BBQ sauce for the perfect savory experience.",
    imagePath: "lib/images/burgers/burgerC.jpg",
    price: 350,
    category: FoodCategory.burgers,
    availableAddons: [
      Addon(name: "Extra bacon", price: 130),
      Addon(name: "BBQ sauce", price: 50),
    ],
  ),
  
    //salads
    Food(
        name: "Greek Salad",
        descriptions: "A fresh and healthy mix of cucumbers, tomatoes, red onions, olives, and feta cheese, dressed with olive oil and oregano.",
        imagePath: "lib/images/salads/Sb.png",
        price: 200,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra Feta Cheese", price: 40),
          Addon(name: "Grilled Chicken", price: 80),
          Addon(name: "Avocado Slices", price: 60),
        ],
      ),
    Food(
        name: "Caesar Salad",
        descriptions: "Crisp romaine lettuce, crunchy croutons, and parmesan cheese tossed in creamy Caesar dressing.",
        imagePath: "lib/images/salads/Sc.png",
        price: 220,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Grilled Shrimp", price: 100),
          Addon(name: "Boiled Egg", price: 50),
          Addon(name: "Bacon Bits", price: 70),
        ],
      ),

    //desserts
      Food(
        name: "Chocolate Lava Cake",
        descriptions: "A warm, decadent chocolate cake with a gooey molten center, served with a scoop of vanilla ice cream.",
        imagePath: "lib/images/desserts/Da.jpeg",
        price: 250,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Extra Ice Cream Scoop", price: 50),
          Addon(name: "Caramel Drizzle", price: 40),
          Addon(name: "Crushed Nuts", price: 30),
        ],
      ),
      Food(
        name: "Classic Cheesecake",
        descriptions: "A rich and creamy cheesecake with a buttery graham cracker crust, topped with your choice of sauce.",
        imagePath: "lib/images/desserts/Db.jpeg.jpg",
        price: 300,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Strawberry Sauce", price: 40),
          Addon(name: "Blueberry Compote", price: 50),
          Addon(name: "Whipped Cream", price: 30),
        ],
      ),
      Food(
      name: "Tiramisu",
      descriptions: "A classic Italian dessert with layers of coffee-soaked sponge, mascarpone cream, and a dusting of cocoa.",
      imagePath: "lib/images/desserts/Dc.jpeg",
      price: 280,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Cocoa Dusting", price: 20),
        Addon(name: "Dark Chocolate Shavings", price: 40),
        Addon(name: "Espresso Shot", price: 50),
      ],
    ),

    //drinks
        Food(
          name: "Fresh Lemonade",
          descriptions: "A refreshing blend of zesty lemons, sweetened to perfection, and served chilled.",
          imagePath: "lib/images/drinks/Drink1.jpeg",
          price: 150,
          category: FoodCategory.drinks,
          availableAddons: [
            Addon(name: "Extra Ice", price: 20),
            Addon(name: "Mint Leaves", price: 30),
            Addon(name: "Honey Drizzle", price: 40),
          ],
        ),
        Food(
          name: "Iced Coffee",
          descriptions: "A smooth, chilled coffee with a rich aroma, perfect for a hot day.",
          imagePath: "lib/images/drinks/Drink2.jpeg",
          price: 180,
          category: FoodCategory.drinks,
          availableAddons: [
            Addon(name: "Extra Shot of Espresso", price: 50),
            Addon(name: "Whipped Cream", price: 40),
            Addon(name: "Vanilla Syrup", price: 30),
          ],
        ),
        Food(
          name: "Mango Smoothie",
          descriptions: "A creamy blend of fresh mangoes, yogurt, and a touch of sweetness.",
          imagePath: "lib/images/drinks/Drink3.jpeg",
          price: 200,
          category: FoodCategory.drinks,
          availableAddons: [
            Addon(name: "Chia Seeds", price: 30),
            Addon(name: "Protein Powder", price: 50),
            Addon(name: "Coconut Flakes", price: 40),
          ],
        ),

   ];

   //getters
   List<Food> get menu => _menu;
}

/*
operations
*/

//add to carts

//remove from carts

//get total price of cart

//get total no of items in cart


//clear the cart



/* helpers */
//generate receipt


//format double value in the money


// formats list of addons into a string summary

