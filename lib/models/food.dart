//food items
class Food{
  final String name;
  final String descriptions;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List <Addon> availableAddons;

  Food({
    required this.name,
    required this.descriptions,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

//food catergory
enum FoodCategory{
  burgers,
  desserts,
  drinks,
  salads,
}

//foods addons
class Addon{
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}