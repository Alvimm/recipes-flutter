import 'package:flutter/material.dart';
import 'package:recipies_app/widgets/home/recipe_list.dart';
import 'package:recipies_app/widgets/home/recipe_type_buttons.dart';

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
          RecipeTypeButtons(onTypeSelected: toggleMealTypeFilter, selectedType: _mealTypeFilter),
          RecipeList(mealTypeFilter: _mealTypeFilter)
        ],
      ),
    );
  }

    void toggleMealTypeFilter(String type) {
    setState(() {
      if (_mealTypeFilter == type) {
        _mealTypeFilter = '';
      } else {
        _mealTypeFilter = type;
      }
    });
  }
}
