import 'package:flutter/material.dart';
import 'recipe.dart';

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;
  final Function(bool) onFavoriteToggle;

  DetailsScreen({required this.recipe, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(recipe.image),
            SizedBox(height: 10),
            Text(recipe.name, style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('Ingredients:\n${recipe.ingredients}'),
            SizedBox(height: 10),
            Text('Instructions:\n${recipe.instructions}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                recipe.isFavorite = !recipe.isFavorite;
                onFavoriteToggle(recipe.isFavorite);
              },
              child: Text(recipe.isFavorite ? 'Unmark as Favorite' : 'Mark as Favorite'),
            ),
          ],
        ),
      ),
    );
  }
}
