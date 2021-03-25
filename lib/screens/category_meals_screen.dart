import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
@override
  void didChangeDependencies() {
  final routArg =
  ModalRoute.of(context).settings.arguments as Map<String, String>;
  final categoryId = routArg['id'];
  categoryTitle = routArg['title'];
  // make a filter to dummy meal in function named meal and return category id from  dummy meal
  displayedMeals = DUMMY_MEALS.where((meal) {
    return meal.categories.contains(categoryId);
  }).toList();
    super.didChangeDependencies();
  }




  void _removeMeal(String meaId){
setState(() {
  displayedMeals.removeWhere((meal) => meal.id==meaId);
});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id:displayedMeals[index].id,
            imageUrl: displayedMeals[index].imageUrl,
            title: displayedMeals[index].title,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem:_removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
