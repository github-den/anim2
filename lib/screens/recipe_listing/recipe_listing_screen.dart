import 'package:duque_assignment6/data/recipes.dart';
import 'package:duque_assignment6/models/category.dart';
import 'package:duque_assignment6/screens/recipe_listing/recipe_tile_components.dart';
import 'package:flutter/material.dart';


class RecipeListingScreen extends StatelessWidget {
  RecipeListingScreen({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final filteredRecipes =
        recipes.where((item) => item.catId == category.id).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        backgroundColor: category.color,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: filteredRecipes.length != 0
              ? ListView.builder(
                  itemBuilder: (_, index) {
                    final recipe = filteredRecipes[index];
                    return RecipeTile(recipe: recipe);
                  },
                  itemCount: filteredRecipes.length,
                )
              : Center(
                  child: Text('No available recipes.'),
                )),
    );
  }
}
