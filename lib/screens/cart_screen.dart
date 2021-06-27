import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    currentUser.cart.forEach((order) {
      totalPrice += order.quantity * order.food.price;
    });
    return Scaffold(
      appBar: AppBar(title: Text('Cart (${currentUser.cart.length})')),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index < currentUser.cart.length) {
              Order order = currentUser.cart[index];
              return _buildCartItem(order, context);
            }
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Estimated Delivery Time",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20.0),
                        ),
                        Text(
                          "25 min",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20.0),
                        )
                      ]),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total Cost",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20.0),
                      ),
                      Text(
                        "\$ ${totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                            color: Colors.green[700]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 80.0,
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 1.0, color: Colors.grey);
          },
          itemCount: currentUser.cart.length + 1),
      bottomSheet: Container(
        height: 80.0,
        width: MediaQuery.of(context).size.width,
        decoration:
            BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, -1),
            blurRadius: 6.0,
          )
        ]),
        child: Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              "CHECKOUT",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildCartItem(Order order, BuildContext context) {
  return Container(
    padding: EdgeInsets.all(20.0),
    height: 170.0,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Container(
                width: 150.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(order.food.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      order.food.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      order.restaurant.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 0.8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            child: Text(
                              "-",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(order.quantity.toString()),
                          SizedBox(
                            width: 20.0,
                          ),
                          GestureDetector(
                            child: Text("+",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: Text(
            "\$ ${order.quantity * order.food.price}",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
        )
      ],
    ),
  );
}
