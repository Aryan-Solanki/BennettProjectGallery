import 'package:flutter/material.dart';

class User {
  final String brandname;
  final String id;
  final String sellerId;
  final String title, detail;
  final List<dynamic> youmayalsolike;
  final double rating;
  final double tax;
  final bool isFavourite, isPopular;

  User({
    @required this.brandname,
    @required this.id,
    @required this.sellerId,
    @required this.title,
    @required this.detail,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.youmayalsolike,
    @required this.tax,
  });
}

// Our demo Products

//   id: "2",
//   brandname: "Organic Tattva",
//   images: [
//     "assets/images/Image Popular Product 2.png",
//   ],
//   colors: [
//     Color(0xFFF6625E),
//     Color(0xFF836DB8),
//     Color(0xFFDECB9C),
//     Colors.white,
//   ],
//   title: "Nike Sport White - Man Pant",
//   price: 50.5,
//   description: description,
//   rating: 4.1,
//   isPopular: true,
// ),
// Product(
//   id: "3",
//   brandname: "Organic Tattva",
//   images: [
//     "assets/images/glap.png",
//   ],
//   colors: [
//     Color(0xFFF6625E),
//     Color(0xFF836DB8),
//     Color(0xFFDECB9C),
//     Colors.white,
//   ],
//   title: "Gloves XC Omega - Polygon",
//   price: 36.55,
//   description: description,
//   rating: 4.1,
//   isFavourite: true,
//   isPopular: true,
// ),
// Product(
//   id: "4",
//   brandname: "Organic Tattva",
//   images: [
//     "assets/images/wireless headset.png",
//   ],
//   colors: [
//     Color(0xFFF6625E),
//     Color(0xFF836DB8),
//     Color(0xFFDECB9C),
//     Colors.white,
//   ],
//   title: "Logitech Head",
//   price: 20.20,
//   description: description,
//   rating: 4.1,
//   isFavourite: true,
//   isPopular: true,
// ),
// ];
//
// const String description =
//     "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharingover precision control your games to sharingover precision control your games to sharingover precision control your games to sharingvover precision control your games to sharingvvvover precision control your games to sharingover precision control your games to sharingover precision control your games to sharing";
