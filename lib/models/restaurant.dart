import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

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
        imagePath: "lib/images/desserts/Db.jpeg",
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
    //user cart
    final List <CartItem> _cart=[];

    //delivery address
    String _deliveryAddress ='44601 Kathmandu';

   //getters
   List<Food> get menu => _menu;
   List<CartItem> get cart => _cart;
   String get deliveryAddress => _deliveryAddress;
   

/*
operations
*/

//add to carts
void addToCart(Food food, List<Addon> selectedAddons){
  //see if there is a cart item already with the same food and selected addons
  CartItem? cartItem =_cart.firstWhereOrNull((item){
    //check if the food items are the same 

    bool isSameFood = item.food==food;

    //check if the list of selected addons are the same 
    bool isSameAddons= 
    const ListEquality().equals(item.selectedAddons, selectedAddons);

    return isSameFood && isSameAddons;
  });

  //if items is already exits then increase its quantity
  if(cartItem!=null){
    cartItem.quantity++;
  }else{
    //otherwise, add a new cart item to the cart
    _cart.add(CartItem(
      food: food,
      selectedAddons: selectedAddons,
      ),
    );
  }
  notifyListeners();
}

//remove from carts
void removeFromCart(CartItem cartItem){
  int cartIndex =_cart.indexOf(cartItem);
  
  if(cartIndex!=-1){
    if(_cart[cartIndex].quantity>1){
      _cart[cartIndex].quantity--;
    }else{
      _cart.removeAt(cartIndex);
    }
  }
  notifyListeners();
}

//get total price of cart
double getTotalPrice(){
  double total =0.0;

  for(CartItem cartItem in _cart){
    double itemTotal =cartItem.food.price;

    for(Addon addon in cartItem.selectedAddons){
      itemTotal +=addon.price;
    }
    total += itemTotal * cartItem.quantity;
  }
  return total;
}

//get total no of items in cart
int getTotalItemCount(){
  int totalItemCount =0;

  for(CartItem cartItem in _cart){
    totalItemCount +=cartItem.quantity;
  }
  return totalItemCount;
}


//clear the cart
void clearCart(){
  _cart.clear();
  notifyListeners();
}

//update delivery address
void updateDeliveryAddress(String newAddress){
  _deliveryAddress= newAddress;
  notifyListeners();
}

/* helpers */
//generate receipt
String displayCartReceipt(){
  final receipt = StringBuffer();
  receipt.writeln("Here is your receipt.");
  receipt.writeln();

  //format the date to include up to seconds only 
  String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  receipt.writeln(formattedDate);
  receipt.writeln();
  receipt.writeln("---------------");
  
  for(final cartItem in _cart){
    receipt.writeln("${cartItem.quantity} x ${cartItem.food.name}-${_formatPrice(cartItem.food.price)}");
    
    if(cartItem.selectedAddons.isNotEmpty){
      receipt.writeln("  Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
    }
    receipt.writeln();
  }
  receipt.writeln("-------------");
  receipt.writeln();
  receipt.writeln("Total Items: ${getTotalItemCount()}");
  receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
  receipt.writeln();
  receipt.writeln("Delivery to: $deliveryAddress");
  
  return receipt.toString();
}


//format double value in the money
String _formatPrice(double price){
  return "Rs.${price.toStringAsFixed(2)}";
}


// formats list of addons into a string summary
String _formatAddons(List<Addon> addons){
    return addons
    .map((addon)=> "${addon.name} (${_formatPrice(addon.price)})")
    .join(",");
}

}