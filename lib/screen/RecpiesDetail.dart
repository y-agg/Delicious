import 'package:flutter/material.dart';
import '../modal/meal.dart';

class RecipiesDetail extends StatefulWidget {
  final Function toggleFavourite;
  final Function _isfavourite;

  RecipiesDetail(this.toggleFavourite, this._isfavourite);

  @override
  _RecipiesDetailState createState() => _RecipiesDetailState();
}

class _RecipiesDetailState extends State<RecipiesDetail> {
  Meal tx;
  bool _switchState = false;
  @override
  Widget build(BuildContext context) {
    String mealId = ModalRoute.of(context).settings.arguments as String;
    tx = dummyMeal.firstWhere((element) => element.id == mealId);
    Size size = MediaQuery.of(context).size;
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.toggleFavourite(mealId);
          },
          elevation: 5,
          splashColor: Colors.grey,
          backgroundColor: Colors.blueGrey[50],
          child: widget._isfavourite(mealId)
              ? Icon(
                  Icons.favorite,
                  color: Colors.black,
                )
              : Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                )),
      body: Stack(children: [
        Center(
          child: Image.network(
            tx.imageUrl,
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          color: Color.fromRGBO(0, 0, 0, 0.60),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8, top: 10),
              child: IconButton(
                  tooltip: "Back",
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              padding: EdgeInsets.only(bottom: 10),
              width: size.width * 0.85,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.orange,
                    width: size.width * 0.002,
                  ),
                ),
              ),
              child: Text(
                tx.title.toUpperCase(),
                style: TextStyle(
                  fontSize: 35 * curScaleFactor,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Switch(
                    value: _switchState,
                    onChanged: (state) {
                      setState(() {
                        _switchState = state;
                      });
                    },
                  ),
                  Text(
                    "Show Steps",
                    style: TextStyle(
                      fontSize: 15 * curScaleFactor,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            if (!_switchState)
              _BuilderItem(
                tx: tx.ingredients,
                titleText: "ingredients",
                size: size,
                curScaleFactor: curScaleFactor,
              ),
            if (_switchState)
              _BuilderItem(
                tx: tx.steps,
                titleText: "Steps",
                size: size,
                curScaleFactor: curScaleFactor,
              ),

            //ADD ITEM BEFORE THIS LINE
          ],
        )
        //ADD ITEM BEFORE THIS LINE
      ]),
    );
  }
}

class _BuilderItem extends StatelessWidget {
  const _BuilderItem({
    Key key,
    @required this.tx,
    @required this.titleText,
    @required this.size,
    @required this.curScaleFactor
  }) : super(key: key);
  
  final Size size;
  final double curScaleFactor;
  final List<String> tx;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                width: size.width * 0.009,
                color: Colors.orange,
              )),
            ),
            child: Text(
              titleText.toUpperCase(),
              style: TextStyle(
                letterSpacing: 4,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30 * curScaleFactor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:10),
            width: size.width* 0.85,
            height: size.height * 0.4,
            decoration: BoxDecoration(
              color: Color.fromRGBO(220, 220, 220, 0.20),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.builder(
              itemCount: tx.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${tx[index]}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25 * curScaleFactor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
