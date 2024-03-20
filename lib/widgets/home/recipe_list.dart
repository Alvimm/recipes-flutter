import 'package:flutter/material.dart';
import 'package:recipies_app/models/recipe.dart';
import 'package:recipies_app/pages/recipe_page.dart';
import 'package:recipies_app/services/data_service.dart';

class RecipeList extends StatelessWidget {
  final String mealTypeFilter;
  const RecipeList({super.key, required this.mealTypeFilter});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: DataService().getRecipes(mealTypeFilter),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Recipe recipe = snapshot.data![index];
              return ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RecipePage(recipe:recipe);
                  }));
                },
                contentPadding: const EdgeInsets.only(top: 10),
                isThreeLine: true,
                title: Text(recipe.name),
                subtitle:
                    Text('${recipe.cuisine}\nDifficulty: ${recipe.difficulty}'),
                leading: Image.network(recipe.image),
                trailing: Text(
                  '${recipe.rating.toString()} ⭐️',
                  style: const TextStyle(fontSize: 15),
                ),
              );
            },
          );
        },
      ),
    );
  }
}