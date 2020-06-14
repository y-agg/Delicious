import 'package:flutter/material.dart';
import './screen/bottomTab_screen.dart';
import './screen/popularCategories_screen.dart';
import './screen/RecpiesDetail.dart';
import './modal/meal.dart';
import './screen/searchScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _favourite = [];
    Map<String, bool> _filters = {
    "isGlutenFree": false,
    "isVegan": false,
    "isVegetarian": false,
    "isLactoseFree": false,
  };
  List<Meal> _avaiableMeal = dummyMeal;
void _saveFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _avaiableMeal = dummyMeal.where((meal) {
        if (_filters["isGlutenFree"] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["isVegan"] && !meal.isVegan) {
          return false;
        }
        if (_filters["isVegetarian"] && !meal.isVegetarian) {
          return false;
        }
        if (_filters["isLactoseFree"] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(mealId) {
    int index = _favourite.indexWhere((element) => mealId == element.id);
    if (index >= 0) {
      setState(() {
        _favourite.removeAt(index);
      });
    } else {
      setState(() {
        _favourite
            .add(dummyMeal.firstWhere((element) => element.id == mealId));
      });
    }
  }
   bool _isfavourite(mealId){
      return _favourite.any((element) => mealId == element.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delicious',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.grey[300],
        fontFamily: "Lora",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => BottomTab(_favourite, _filters, _saveFilters ,),
        "/PopluarCategories": (context) => PopluarCategories(_avaiableMeal),
        "/RecipiesDetail": (context) => RecipiesDetail(toggleFavourite,_isfavourite),
        "/Search": (context) => Search(),
      },
    );
  }
}
