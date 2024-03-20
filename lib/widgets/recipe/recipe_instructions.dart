import 'package:flutter/material.dart';
import 'package:recipies_app/models/recipe.dart';

class RecipeInstructions extends StatelessWidget {
  final Recipe recipe;
  const RecipeInstructions({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: recipe.instructions.map((instruction) {
          return Text(
            '${recipe.instructions.indexOf(instruction) + 1}. $instruction\n',
              maxLines: 3,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 15));
        }).toList(),
      ),
    );
  }
}