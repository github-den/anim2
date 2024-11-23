import 'package:duque_assignment6/models/category.dart';
import 'package:duque_assignment6/screens/recipe_listing/recipe_listing_screen.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => RecipeListingScreen(
            category: category,
          ),
        ),
      ),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              //color: category.color,
              gradient: LinearGradient(
                colors: [
                  category.color,
                  category.color.withOpacity(0.65),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Center(child: Text(category.name))),
    );
  }
}
