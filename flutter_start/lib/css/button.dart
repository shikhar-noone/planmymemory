import 'package:flutter/material.dart';

class CustomButtonStyle {
  static const TextStyle headerStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    color: Color.fromARGB(255, 78, 29, 29),
  );

  static const BoxDecoration containerDecoration = BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(255, 214, 191, 189),
        Color.fromARGB(255, 14, 15, 15)
      ],
    ),
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 69, 67, 67),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 2),
      ),
    ],
  );
}
