import 'package:flutter/material.dart';
import 'package:mobile/utils/constant/size.dart';

class CoverWidget extends StatelessWidget {
  final String image;
  const CoverWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Size.fullWidth(context),
      height: Size.heightPercent(context, 0.32),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
