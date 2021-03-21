import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routArg['id'];
    final categoryTitle = routArg['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: null,
    );
  }
}
