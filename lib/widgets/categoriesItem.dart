import 'package:flutter/material.dart';
import '../modal/meal.dart';
class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    Key key,
    @required this.categoriesList,
  }) : super(key: key);

  final List<Meal> categoriesList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...categoriesList.map((e) {
          return InkWell(
            onTap: (){
              Navigator.of(context).pushNamed("/RecipiesDetail", arguments: e.id);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(
                left: 10,
                top: 10,
                right: 10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: Image.network(
                            e.imageUrl,
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
                          child: Flexible(
                            child: Text(
                              e.title,
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
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule),
                            SizedBox(
                              height: 40,
                            ),
                            Text("  ${e.duration} min")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work),
                            SizedBox(
                              height: 40,
                            ),
                            Text(" ${complexityText(e.complexity)}")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money),
                            SizedBox(
                              height: 40,
                            ),
                            Text(" ${affordibilityText(e.affordability)}")
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
