import 'package:flutter/material.dart';
import 'package:recipies_app/models/recipe.dart';

class RecipeIngredients extends StatelessWidget {
  final Recipe recipe;
  const RecipeIngredients({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: recipe.ingredients.map((ingredient) {
          return Row(
            children: [
              const Icon(Icons.check_box, color: Colors.green),
              Text(' $ingredient'),
            ],
          );
        }).toList(),
      ),
    );
  }
}