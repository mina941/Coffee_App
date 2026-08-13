class DrinkModel {
  final String image;
  final String name;
  final String title;
  final String price;

  DrinkModel({
    required this.image,
    required this.name,
    required this.title,
    required this.price,
  });

  static List<DrinkModel> drinks = [
    DrinkModel(
      image: "assets/drinks/Banana.png",
      name: "Banana",
      title: "20 Flavors of Your Drink",
      price: "20",
    ),

    DrinkModel(
      image: "assets/drinks/Brownie Island.png",
      name: "Brownie",
      title: "30 Flavors of Your Drink",
      price: "39",
    ),

    DrinkModel(
      image: "assets/drinks/Chocolate.png",
      name: "Chocolate",
      title: "30 Flavors of Your Drink",
      price: "45",
    ),

    DrinkModel(
      image: "assets/drinks/Peanut Butter.png",
      name: "Peanut Butter",
      title: "5 Flavors of Your Drink",
      price: "59",
    ),

    DrinkModel(
      image: "assets/drinks/Salted Caramel.png",
      name: "Salted Caramel",
      title: "30 Flavors of Your Drink",
      price: "98",
    ),

    DrinkModel(
      image: "assets/drinks/Strawberry.png",
      name: "Strawberry",
      title: "30 Flavors of Your Drink",
      price: "87",
    ),

    DrinkModel(
      image: "assets/drinks/Brownie Island.png",
      name: "Brownie",
      title: "30 Flavors of Your Drink",
      price: "39",
    ),

    DrinkModel(
      image: "assets/drinks/Banana.png",
      name: "Banana",
      title: "30 Flavors of Your Drink",
      price: "40",
    ),

    DrinkModel(
      image: "assets/drinks/carmel.png",
      name: "Carmel",
      title: "30 Flavors of Your Drink",
      price: "42",
    ),

    DrinkModel(
      image: "assets/drinks/Brownie Island.png",
      name: "Brownie",
      title: "30 Flavors of Your Drink",
      price: "39",
    ),
  ];
}
