import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons ={};

   FoodPage({
    super.key,
    required this.food,
  }){
    //initialize selected addons to be false
    for(Addon addon in food.availableAddons){
      selectedAddons[addon]=false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //stack UI
        Scaffold(
      body: SingleChildScrollView( // Wrap the content in a scrollable container
        child: Column(
          children: [
            // Food image
            Image.asset(widget.food.imagePath),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food name
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  // Food price
                  Text(
                    'Rs. ' + widget.food.price.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Food description
                  Text(widget.food.descriptions),

                  Divider(
                    color: Theme.of(context).colorScheme.secondary,
                  ),

                  const SizedBox(height: 10),

                  // Add-ons header
                  Text(
                    "Add-ons",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Add-ons list
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true, // Allow ListView to take only the space it needs
                      itemCount: widget.food.availableAddons.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        // Get individual add-on
                        Addon addon = widget.food.availableAddons[index];

                        // Return checkbox UI
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text(
                            'Rs. ' + addon.price.toString(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon]=value!;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Add-to-cart button (placeholder)
            MyButton(
              text: "Add to cart",
              onTap: (){}
              ),

              const SizedBox(height: 25),
          ],
        ),
      ),
    ),
        //back button
        SafeArea(
          child: Opacity(
            opacity: 0.7,
            child: Container(
              margin:const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
                ),
                child: IconButton
                (onPressed: ()=> Navigator.pop(context),
                 icon:const Icon (Icons.arrow_back_ios_rounded),
             ),
            ),
          ),
        )
      ],
    );
  }
}
