import 'package:flutter/material.dart';
import './home_screen.dart';
import './favourite_screen.dart';
import './setting_screen.dart';
import '../modal/meal.dart';

class BottomTab extends StatefulWidget {
  final List<Meal> _favourite;
  final Function _saveFilters;
  final Map<String, bool> _filters;
  BottomTab(this._favourite, this._filters, this._saveFilters);
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  List<Map<String, Object>> _screenInfo;
  @override
  void initState() {
    _screenInfo = [
      {
        "title": "Delicious",
        "screen": Home(),
      },
      {
        "title": "Favourite",
        "screen": Favourite(widget._favourite),
      },
      {
        "title": "Filters",
        "screen": Setting(widget._filters, widget._saveFilters),
      },
    ];

    super.initState();
  }

  int _selectedindex = 0;
  void onTapFunction(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  BottomNavigationBarItem _builderBottomIcon(
      String titleText, IconData iconType) {
    return BottomNavigationBarItem(
      backgroundColor: Theme.of(context).primaryColor,
      icon: Icon(
        iconType,
        color: Colors.black,
      ),
      title: Text(
        titleText,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _screenInfo[_selectedindex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapFunction,
        currentIndex: _selectedindex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColor,
        selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        unselectedIconTheme:
            IconThemeData(color: Theme.of(context).accentColor),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          _builderBottomIcon("Home", Icons.home),
          _builderBottomIcon("Favourite", Icons.favorite),
          _builderBottomIcon("Filters", Icons.settings),
        ],
      ),
    );
  }
}
