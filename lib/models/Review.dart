import 'package:flutter/material.dart';

class Review {
  final String reviewText;
  final String name;
  final String date;
  final double rating;

  Review({
    @required this.reviewText,
    @required this.name,
    @required this.date,
    @required this.rating,
  });
}
