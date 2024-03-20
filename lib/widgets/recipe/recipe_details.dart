import 'package:flutter/material.dart';
import 'package:recipies_app/models/recipe.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetails({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${recipe.cuisine}, ${recipe.difficulty}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
          Text(
            recipe.name,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            'Prep time: ${recipe.prepTimeMinutes} Minutes | Cook Time: ${recipe.cookTimeMinutes} Minutes',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          Text(
            '${recipe.rating.toString()} ⭐️ | ${recipe.reviewCount} Reviews',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}