import 'package:flutter/material.dart';
import '../../modal/meal.dart';

class WeekRecipies extends StatelessWidget {
  const WeekRecipies({
    Key key,
    @required List<Meal> listBuilder,
  })  : _listBuilder = listBuilder,
        super(key: key);

  final List<Meal> _listBuilder;

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
            "THIS WEEK RECIPIES",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 4,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ..._listBuilder.map((e) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("/RecipiesDetail", arguments: e.id);
                    },
                    child: Container(
                      height: 200,
                      width: 280,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(e.imageUrl),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 160,
                                  child: Text(
                                    e.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                padding: EdgeInsets.only(left: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundImage:
                                          NetworkImage(e.authorUrl),
                                    ),
                                    Container(
                                      height: 30,
                                      alignment: Alignment.center,
                                      child: Text(
                                        e.author,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
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
