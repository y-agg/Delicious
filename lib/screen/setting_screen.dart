import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  final Function _saveFilters;
  final Map<String, bool> _filters;
  Setting(this._filters, this._saveFilters);
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  @override
  void initState() {
    isGlutenFree = widget._filters["isGlutenFree"];
    isVegan = widget._filters["isVegan"];
    isVegetarian = widget._filters["isVegetarian"];
    isLactoseFree = widget._filters["isLactoseFree"];
    super.initState();
  }
  void _saveData() {
    widget._saveFilters({
      "isGlutenFree": isGlutenFree,
      "isVegan": isVegan,
      "isVegetarian": isVegetarian,
      "isLactoseFree": isLactoseFree,
    });
    Navigator.of(context).popAndPushNamed("/");
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.only(
        left: size.width * 0.05,
        right: size.width * 0.05,
      ),
      color: Colors.grey[300],
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.19),
                child: Text(
                  "Filter Recipies",
                  style: TextStyle(
                    letterSpacing: 4,
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: IconButton(
                  onPressed: _saveData,
                  icon: Icon(Icons.save),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "GlutenFree",
                style: TextStyle(
                  letterSpacing: 4,
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: isGlutenFree,
                onChanged: (val) {
                  setState(() {
                    isGlutenFree = val;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Vegan",
                style: TextStyle(
                  letterSpacing: 4,
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: isVegan,
                onChanged: (val) {
                  setState(() {
                    isVegan = val;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Vegetarian",
                style: TextStyle(
                  letterSpacing: 4,
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: isVegetarian,
                onChanged: (val) {
                  setState(() {
                    isVegetarian = val;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Lactose Free",
                style: TextStyle(
                  letterSpacing: 4,
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: isLactoseFree,
                onChanged: (val) {
                  setState(() {
                    isLactoseFree = val;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
