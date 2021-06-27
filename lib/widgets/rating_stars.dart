import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  RatingStars(this.rating);
  Widget build(BuildContext context) {
    String stars = '';
    for (int i = 0; i < this.rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(
      stars,
      style: TextStyle(
        fontSize: 18.0,
      ),
    );
  }
}
