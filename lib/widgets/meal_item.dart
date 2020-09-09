import 'package:MealApp/screens/meal_details.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  String get complexityText {
    switch (meal.complexity) {
      case MealComplexity.Challenging:
        return "Simple";
        break;
      case MealComplexity.Hard:
        return "Hard";
        break;
      case MealComplexity.Simple:
        return "Simple";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case MealAffordability.Affordable:
        return "\$";
        break;
      case MealAffordability.Pricey:
        return "\$\$";
        break;
      case MealAffordability.Luxurious:
        return "\$\$\$";
        break;
      default:
        return "?";
        break;
    }
  }

  final Meal meal;
  final Function removeItem;
  MealItem({
    @required this.meal,
    @required this.removeItem,
  });
  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetails.routeName,
      arguments: meal,
    )
        .then((value) {
      if (value != null) {
        removeItem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 5),
                      Text("${meal.duration} min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 5),
                      Text("${complexityText}"),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Cost:"),
                      SizedBox(width: 5),
                      Text("${affordabilityText}"),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
