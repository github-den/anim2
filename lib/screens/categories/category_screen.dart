import 'package:duque_assignment6/data/categories.dart';
import 'package:duque_assignment6/screens/categories/category_tile_component.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pinoy Recipes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (_, index) {
            final category = categories[index];
            return CategoryTile(category: category);
          },
          itemCount: categories.length,
        ),
      ),
    );
  }
}
