import 'package:flutter/material.dart';
import 'package:recipies_app/models/recipe.dart';
import 'package:recipies_app/widgets/recipe/recipe_details.dart';
import 'package:recipies_app/widgets/recipe/recipe_image.dart';
import 'package:recipies_app/widgets/recipe/recipe_ingredients.dart';
import 'package:recipies_app/widgets/recipe/recipe_instructions.dart';

class RecipePage extends StatelessWidget {
  final Recipe recipe;

  const RecipePage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(22, 6, 71, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(118, 22, 6, 71),
        title: const Text('Recipe Book'),
        centerTitle: true,
      ),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RecipeImage(recipe: recipe),
          RecipeDetails(recipe: recipe),
          RecipeIngredients(recipe: recipe),
          RecipeInstructions(recipe: recipe)
        ],
      ),
    );
  }

}
