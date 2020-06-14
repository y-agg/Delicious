import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    Key key,
  }) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 10.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(25),
        child: TextFormField(
          keyboardType: TextInputType.text,
          controller: searchText,
          onFieldSubmitted: (val) {
            Navigator.of(context)
                .pushNamed("/Search", arguments: searchText.text);
          },
          decoration: InputDecoration(
            fillColor: Colors.black.withOpacity(0.6),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10),
            prefixIcon: Icon(Icons.search, color: Colors.black),
            hintText: 'Search for recipes '.toUpperCase(),
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      height: 40,
    );
  }
}
