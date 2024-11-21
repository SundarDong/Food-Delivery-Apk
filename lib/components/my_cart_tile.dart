import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_quantity_selector.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {

  final CartItem cartItem;

  const MyCartTile({
    super.key,
    required this.cartItem,
    });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder:(context, restaurant, child)=> Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
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
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          cartItem.food.imagePath,
                          fit: BoxFit.cover, // Ensures the image covers the available area
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 10),

                  //name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(cartItem.food.name),
              
                      //food price
                       Text('Rs.${cartItem.food.price}',
                       style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                       ),
                       ),
                    ],
                  ),

                  const Spacer(),
              
                  //increment and decrement of quantity
                  QuantitySelector(
                    quantity: cartItem.quantity,
                    food: cartItem.food,
                    onIncrement: (){
                      restaurant.addToCart(
                        cartItem.food, cartItem.selectedAddons);
                    },
                    onDecrement: (){
                      restaurant.removeFromCart(cartItem);
                    }
                  ),
                ],
              ),
            ),

            //addons
            SizedBox(
              height: cartItem.selectedAddons.isEmpty? 0: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                children: cartItem.selectedAddons.map((addon)=>Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(label: Row(
                    children: [
                      //addons name
                      Text(addon.name),
                  
                      //addon price
                      Text(' Rs.${addon.price}'),
                    ],
                  ), 
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    )
                  ),
                  onSelected: (value){},
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 12,
                  ),
                  ),
                ),
               ).toList(),
              ),
            )
          ],
        ),
      )
    );
  }
}