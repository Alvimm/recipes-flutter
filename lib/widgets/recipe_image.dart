import 'package:flutter/material.dart';
import 'package:recipies_app/models/recipe.dart';

class RecipeImage extends StatelessWidget {
  final Recipe recipe;
  const RecipeImage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
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
}