import 'package:flutter/material.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/widgets/rating_stars.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen(this.restaurant);
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Hero(
              tag: widget.restaurant.imageUrl,
              child: Image(
                height: 220.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                image: AssetImage(widget.restaurant.imageUrl),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    iconSize: 30.0,
                    onPressed: () => Navigator.of(context).pop()),
                IconButton(
                    icon: Icon(Icons.favorite),
                    color: Theme.of(context).primaryColor,
                    iconSize: 35.0,
                    onPressed: () {})
              ],
            )
          ]),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '0.2 miles away',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                RatingStars(widget.restaurant.rating),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "Reviews",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "Contact",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text(
              'menu',
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(10.0),
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return _buildMenuItem(food);
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(Food food) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 175.0,
              width: 175.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(food.imageUrl), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            Container(
              height: 175.0,
              width: 175.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black87.withOpacity(0.3),
                      Colors.black54.withOpacity(0.3),
                      Colors.black38.withOpacity(0.3)
                    ],
                    stops: [
                      0.1,
                      0.4,
                      0.6,
                      0.9
                    ]),
              ),
            ),
            Positioned(
              bottom: 65.0,
              child: Column(
                children: <Widget>[
                  Text(
                    food.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2),
                  ),
                  Text('\$ ${food.price.toString()}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2)),
                ],
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0)),
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
