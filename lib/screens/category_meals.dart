import 'package:flutter/material.dart';
import '../models/category.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final Category category;
  // CategoryMealsScreen(this.category);
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      Category category = ModalRoute.of(context).settings.arguments as Category;
      categoryTitle = category.title;
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(Meal meal) {
    setState(() {
      widget.availableMeals.removeWhere((element) => meal.id == element.id);
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
            meal: widget.availableMeals[index],
            removeItem: _removeItem,
          );
        },
        itemCount: widget.availableMeals.length,
      ),
    );
  }
}
