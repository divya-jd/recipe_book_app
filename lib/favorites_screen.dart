import 'package:flutter/material.dart';
import 'recipe.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe> recipes;

  FavoritesScreen({required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              recipes[index].image,
              width: 50,
              height: 50,
            ),
            title: Text(recipes[index].name),
          );
        },
      ),
    );
  }
}
