import 'package:flutter/material.dart';
import '../modal/meal.dart';
import '../widgets/categoriesItem.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    String searchText = ModalRoute.of(context).settings.arguments as String;
    searchText = searchText.toLowerCase();
    List<Meal> tx = dummyMeal
        .where((element) => element.title.toLowerCase().contains(searchText))
        .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            "Search Result for ${searchText.replaceFirst(searchText[0], searchText[0].toUpperCase())} "),
      ),
      body: Container(
        child: tx.isNotEmpty
            ? CategoriesItem(
                categoriesList: tx,
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/result.gif",
                      fit: BoxFit.fitHeight,
                      height: size.size.height * 0.4,
                      width: size.size.width * 0.5,
                    ),
                    SizedBox(
                      height: size.size.height * 0.02,
                    ),
                    Text(
                      "No Result Found...",
                      style: TextStyle(
                        fontSize: 20 * size.textScaleFactor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
