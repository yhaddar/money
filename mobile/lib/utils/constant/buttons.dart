import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/utils/constant/size.dart';

import 'color.dart';

class Buttons {
  static Container elevatedButton(BuildContext context, method, text) {
    return Container(
      decoration: BoxDecoration(
        color: AllColors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      width: Size.fullWidth(context),
      height: Size.height(65),
      child: ElevatedButton(
        onPressed: method,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: GoogleFonts.balsamiqSans(color: AllColors.white, fontSize: 21),
        ),
      ),
    );
  }

  static ElevatedButton iconButton(Icon icon, method) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
      ),
      onPressed: method,
      child: icon,
    );
  }

  static FilledButton textButton(String text, method) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero
      ),
      onPressed: method,
      child: Text(
        text,
        style: GoogleFonts.balsamiqSans(
          color: AllColors.hypertext,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
