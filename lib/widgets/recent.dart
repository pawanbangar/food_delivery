import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/models/order.dart';

class Recentorders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Recent Orders",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2),
          ),
        ),
        Container(
          height: 120.0,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10.0),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              return _buildRecentOrder(order, context);
            },
            itemCount: currentUser.orders.length,
          ),
        ),
      ],
    );
  }
}

Widget _buildRecentOrder(Order order, BuildContext context) {
  return Container(
    margin: EdgeInsets.all(10.0),
    width: 320.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(width: 1.0, color: Colors.grey[200]),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: 100.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                  image: AssetImage(order.food.imageUrl),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        order.food.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        order.restaurant.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(order.date,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 20.0),
          width: 48.0,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0)),
          child: IconButton(
            color: Colors.white,
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        )
      ],
    ),
  );
}
