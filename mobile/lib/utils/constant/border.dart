import 'package:flutter/material.dart';

class BorderInput {

  static OutlineInputBorder outlineInputBorder(double width, Color color){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }
}