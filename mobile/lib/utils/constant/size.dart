import 'package:flutter/cupertino.dart';

class Size {

  static double fullWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static double fullHeight(BuildContext context) => MediaQuery.of(context).size.height;

  static double width(double width) => width;
  static double height(double height) => height;

}
