import 'package:flutter/material.dart';
import 'package:recipies_app/models/recipe.dart';
import 'package:recipies_app/pages/recipe_page.dart';
import 'package:recipies_app/services/data_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _mealTypeFilter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(22, 6, 71, 1),
      appBar: AppBar(
        title: const Text('Recipe Book'),
        centerTitle: true,
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          _recipeTypeButtons(),
          _recipeList(),
        ],
      ),
    );
  }

  Widget _recipeTypeButtons() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.05,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FilledButton(
                    onPressed: () {
                      setState(() {
                        _mealTypeFilter = 'snack';
                      });
                    },
                    child: const Text(
                      '🥕 Snack',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FilledButton(
                    onPressed: () {
                      setState(() {
                        _mealTypeFilter = 'breakfast';
                      });
                    },
                    child: const Text(
                      '🍳 Breakfast',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FilledButton(
                    onPressed: () {
                      setState(() {
                        _mealTypeFilter = 'lunch';
                      });
                    },
                    child: const Text(
                      '🍗 Lunch',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FilledButton(
                    onPressed: () {
                      setState(() {
                        _mealTypeFilter = 'dinner';
                      });
                    },
                    child: const Text(
                      '🥩 Dinner',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FilledButton(
                    onPressed: () {
                      setState(() {
                        _mealTypeFilter = 'beverage';
                      });
                    },
                    child: const Text(
                      '🍹 Beverage',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FilledButton(
                    onPressed: () {
                      setState(() {
                        _mealTypeFilter = 'dessert';
                      });
                    },
                    child: const Text(
                      '🍨 Dessert',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FilledButton(
                    onPressed: () {
                      setState(() {
                        _mealTypeFilter = 'Side Dish';
                      });
                    },
                    child: const Text(
                      '🥗 Side Dish',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FilledButton(
                    onPressed: () {
                      setState(() {
                        _mealTypeFilter = 'Appetizer';
                      });
                    },
                    child: const Text(
                      ' 🌮 Appetizer',
                    )),
              )
            ],
          )),
    );
  }

  Widget _recipeList() {
    return Expanded(
        child: FutureBuilder(
      future: DataService().getRecipes(_mealTypeFilter),
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
    ));
  }
}
