class Recipe {
  String name;
  String image;
  bool isFavorite;
  String ingredients;
  String instructions;

  Recipe({
    required this.name,
    required this.image,
    this.isFavorite = false,
    required this.ingredients,
    required this.instructions,
  });
}
