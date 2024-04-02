import 'package:flutter/material.dart';

class AppTestStyle {
  static TextStyle showDetailsTextStyle = const TextStyle(
      fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold);
  static TextStyle errorTextStyle = const TextStyle(
      color: Colors.yellow, fontSize: 15, fontWeight: FontWeight.bold);
  static TextStyle titleTextStyle = const TextStyle(
      color: Colors.yellow, fontSize: 15, fontWeight: FontWeight.bold);
  static TextStyle titleSmallTextStyle =
      const TextStyle(fontSize: 14, letterSpacing: 0.5);
  static TextStyle contentTextStyle=const TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  static TextStyle completeTextStyle=const TextStyle(fontSize: 10, fontWeight: FontWeight.w600,color: Colors.green);
  static TextStyle unCompleteTextStyle=const TextStyle(fontSize: 10, fontWeight: FontWeight.w600,color: Colors.red);
}
