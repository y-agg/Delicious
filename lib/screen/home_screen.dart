import 'package:flutter/material.dart';
import '../modal/meal.dart';

import '../widgets/home_screen_widgets/PopularCategories.dart';
import '../widgets/home_screen_widgets/weekRecipies.dart';
import '../widgets/home_screen_widgets/todayRecipie.dart';
import '../widgets/home_screen_widgets/SearchBox.dart';


class Home extends StatelessWidget {
  List<Meal> get _listBuilder {
    List<Meal> _itemList = [];
    DateTime date = DateTime.now().subtract(Duration(days: 7));
    for (var i = 0; i < dummyMeal.length; i++) {
      if (dummyMeal[i].date.isAfter(date)) {
        _itemList.add(dummyMeal[i]);
      }
    }
    return _itemList;
  }

  Meal get _todaysRecipies {
    DateTime date = DateTime.now();
    return dummyMeal.firstWhere((element) => element.date.day == date.day);
  }

  @override
  Widget build(BuildContext context) {
    bool landscape= MediaQuery.of(context).orientation == Orientation.landscape;
    Size size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey[100],
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.40,
                width: double.infinity,
                color: Colors.grey[300],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SearchBox(),
                  PopularCategories(),
                   WeekRecipies(listBuilder: _listBuilder),
                  if(!landscape) TodayRecipe(todaysRecipies: _todaysRecipies),
                  //TO ADD NEW ITEN AFTER ...
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}