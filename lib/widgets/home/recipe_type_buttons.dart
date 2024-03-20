import 'package:flutter/material.dart';

class RecipeTypeButtons extends StatelessWidget {
  final Function(String) onTypeSelected;
  final String selectedType;

  const RecipeTypeButtons({super.key, required this.onTypeSelected, required this.selectedType});

  @override
  Widget build(BuildContext context) {
    final mealTypes = {
      'snack': '🥕',
      'breakfast': '🍳',
      'lunch': '🍗',
      'dinner': '🥩',
      'beverage': '🍹',
      'dessert': '🍨',
      'Side Dish': '🥗',
      'Appetizer': '🌮',
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: mealTypes.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                onPressed: () => onTypeSelected(entry.key),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(selectedType == entry.key ?Colors.lightBlueAccent : Colors.blue),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text('${entry.value} ${entry.key}'),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
