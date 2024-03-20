import 'package:flutter/material.dart';
import 'package:recipies_app/models/recipe.dart';

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
          _recipeImage(context),
          _recipeDetails(context),
          _recipeIngredients(context),
          _recipeIntructions(context),
        ],
      ),
    );
  }

  Widget _recipeImage(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            recipe.image,
          ),
        )));
  }

  Widget _recipeDetails(BuildContext context) {
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

  Widget _recipeIngredients(BuildContext context) {
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

  Widget _recipeIntructions(BuildContext context) {
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
