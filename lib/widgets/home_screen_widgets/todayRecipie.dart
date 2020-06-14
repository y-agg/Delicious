import 'package:flutter/material.dart';
import '../../modal/meal.dart';

class TodayRecipe extends StatelessWidget {
  const TodayRecipe({
    Key key,
    @required Meal todaysRecipies,
  })  : _todaysRecipies = todaysRecipies,
        super(key: key);

  final Meal _todaysRecipies;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 5, color: Colors.orange[200]),
        ),
      ),
      padding: EdgeInsets.only(
        left: 20,
        top: 10,
        right: 20,
      ),
      margin: EdgeInsets.only(
        left: 10,
        top: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TODAY'S RECIPIES",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 4,
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed("/RecipiesDetail", arguments: _todaysRecipies.id);
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      _todaysRecipies.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      _todaysRecipies.title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
