import 'package:flutter/material.dart';
import '../../modal/category.dart';

class PopularCategories extends StatelessWidget {
  const PopularCategories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 5, color: Colors.orange[200]),
        ),
      ),
      padding: EdgeInsets.only(left: 10, top: 10),
      margin: EdgeInsets.only(left: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular Categories",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 4,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 40,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...categoryDummyData.map((e) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("/PopluarCategories", arguments: {
                        "id": e.id,
                        "title": e.title,
                      });
                    }, // CONNECT THIS FUNCTION
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        e.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                }).toList()
              ],
            ),
          )
        ],
      ),
    );
  }
}
