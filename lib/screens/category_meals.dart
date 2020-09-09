import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data/data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final Category category;
  // CategoryMealsScreen(this.category);

  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(category.id))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
