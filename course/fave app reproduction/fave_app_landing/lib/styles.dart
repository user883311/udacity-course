import 'package:flutter/material.dart';

Color white = Color.fromRGBO(251, 251, 251, 1.0);
Color captionGrey = Color.fromRGBO(180, 184, 189, 1.0);
Color darkGrey = Color.fromRGBO(34, 34, 34, 1.0);
EdgeInsets edgeInsetTen = EdgeInsets.all(10.0);
EdgeInsets edgeInsetFive = EdgeInsets.all(5.0);



ThemeData darkTheme = new ThemeData(
  fontFamily: "Hoefler",
  primaryColor: darkGrey,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(
    body1: TextStyle(
      color: white,
      fontSize: 22.0,
    ),
    body2: TextStyle(
      color: white,
      fontSize: 24.0,
    ),
    button: TextStyle(
      color: Colors.green,
      fontSize: 15.0,
    ),
    caption: TextStyle(
      color: captionGrey,
      fontSize: 20.0,
    ),
    display1: TextStyle(
      color: white,
      fontSize: 25.0,
    ),
    headline: TextStyle(
      
      color: white,
      fontSize: 28.0,
      // fontFamily: "Hoefler",
    ),
    title: TextStyle(
      color: white,
      fontSize: 35.0,
    ),
  ),
);

final buttonSize = 40.0;