import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function() onTap;

  const MyFoodTile({
    super.key,
    required this.food,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text("\Rs." + food.price.toString(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      ),
                      const SizedBox(height: 10),
                      Text(food.descriptions,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      ), 
                    ],
                  ),
                ),

                const SizedBox(width: 15),

                //food image
                ClipRRect(
                  borderRadius:BorderRadius.circular(8),
                  child: Image.asset(food.imagePath,
                  height: 120,
                  ),
                ),
              ],
            ),
          ),
        ),

        //divider
        Divider(
        color: Theme.of(context).colorScheme.tertiary,
        endIndent: 25,
        indent: 25,
        )
      ],
    );
  }
}