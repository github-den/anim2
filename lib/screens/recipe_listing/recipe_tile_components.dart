import 'package:duque_assignment6/models/recipe.dart';
import 'package:duque_assignment6/screens/recipe_view/recipe_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => RecipeViewScreen(
                recipe: recipe,
              ))),
      child: Card(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: AspectRatio(
                    aspectRatio: 3 / 2,
                    child: recipe.imageUrl != null
                        ? Image.network(
                            recipe.imageUrl!,
                            fit: BoxFit.cover,
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('No available image'),
                          ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    color: Colors.black54,
                    child: Text(
                      recipe.name,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              ],
            ),
           Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.timer),
                Gap(6),
                Text(
                  '${recipe.duration} min',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Gap(12),
          ],
        ),
      ),
    );
  }
}
