class Recipe {
  late int id;
  late int catId;
  late String name;
  late List<String> ingredients;
  late List<String> steps;
  late int duration;
  String? imageUrl;

  Recipe({
    required this.id,
    required this.catId,
    required this.name,
    required this.ingredients,
    required this.steps,
    this.duration = 0,
    this.imageUrl,
  });
}
