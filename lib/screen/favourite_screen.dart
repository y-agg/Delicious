import 'package:flutter/material.dart';
import '../modal/meal.dart';
import '../widgets/categoriesItem.dart';

class Favourite extends StatelessWidget {
  final List<Meal> favourite;
  Favourite(this.favourite);
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context);
    return favourite.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/sleep.gif",
                  fit: BoxFit.fitHeight,
                  height: size.size.height * 0.4,
                  width: size.size.width * 0.7,
                ),
                SizedBox(
                  height: size.size.height * 0.02,
                ),
                Text(
                  "Add Some Favourite...",
                  style: TextStyle(
                    fontSize: 20 * size.textScaleFactor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        : Container(
            child: CategoriesItem(
              categoriesList: favourite,
            ),
          );
  }
}
