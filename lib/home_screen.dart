import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';
import 'recipe.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Recipe> recipes = [
    Recipe(
      name: 'Burger',
      image: 'assets/burger.jpg',
      ingredients: '1. Bun\n2. Patty\n3. Lettuce\n4. Tomato\n5. Cheese',
      instructions: '1. Cook the patty.\n2. Assemble the burger with all ingredients.',
    ),
    Recipe(
      name: 'Curry',
      image: 'assets/curry.jpg',
      ingredients: '1. Chicken\n2. Curry Powder\n3. Coconut Milk\n4. Vegetables',
      instructions: '1. Cook chicken with spices.\n2. Add coconut milk and veggies.',
    ),
    Recipe(
      name: 'Pasta',
      image: 'assets/pasta.jpg',
      ingredients: '1. Pasta\n2. Olive Oil\n3. Garlic\n4. Parmesan',
      instructions: '1. Boil pasta.\n2. Sauté garlic in oil, mix with pasta.',
    ),
    Recipe(
      name: 'Pizza',
      image: 'assets/pizza.jpg',
      ingredients: '1. Dough\n2. Sauce\n3. Cheese\n4. Toppings',
      instructions: '1. Spread sauce on dough.\n2. Add toppings and bake.',
    ),
    Recipe(
      name: 'Sushi',
      image: 'assets/sushi.jpg',
      ingredients: '1. Rice\n2. Seaweed\n3. Fish\n4. Vegetables',
      instructions: '1. Cook rice.\n2. Roll rice with fillings in seaweed.',
    ),
    Recipe(
      name: 'Salad',
      image: 'assets/salad.jpg',
      ingredients: '1. Lettuce\n2. Tomato\n3. Cucumber\n4. Dressing',
      instructions: '1. Chop vegetables.\n2. Toss with dressing.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Recipe Book'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(
                    recipes: recipes.where((recipe) => recipe.isFavorite).toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), 
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              child: ListTile(
                leading: Image.asset(
                  recipes[index].image,
                  width: 50,
                  height: 50,
                ),
                title: Text(
                  recipes[index].name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recipe: recipes[index],
                          onFavoriteToggle: (isFavorite) {
                            setState(() {
                              recipes[index].isFavorite = isFavorite;
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: Text('View'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, 
                    foregroundColor: Colors.white, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), 
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
