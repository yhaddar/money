import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile/utils/constant/color.dart';
import 'package:mobile/utils/constant/size.dart';
import 'package:mobile/utils/constant/border.dart';

import '../../../utils/constant/buttons.dart';

class InputWidget extends StatefulWidget {
  final String hint;
  final String label;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final RegExp regex;

  const InputWidget({required this.hint, required this.label, super.key, this.textInputType = TextInputType.text, required this.textEditingController, required this.regex});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool isHidden = false;

  void show () {
    if(!isHidden){
      setState(() {
        isHidden = true;
      });
    }else {
      setState(() {
        isHidden = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('${widget.label} : ',
          style: GoogleFonts.poppins(
            fontSize: 16
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: Size.fullWidth(context),
          height: Size.height(70),
          child: TextFormField(
            keyboardType: widget.textInputType,
            obscureText: widget.textInputType == TextInputType.visiblePassword ? !isHidden : false,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              enabledBorder: BorderInput.outlineInputBorder(2, AllColors.orange),
              focusedBorder: BorderInput.outlineInputBorder(3, AllColors.orange),
              errorBorder: BorderInput.outlineInputBorder(3, AllColors.danger),
              hint: Text(widget.hint, style: GoogleFonts.poppins(),),
              contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              suffixIcon: widget.label == "Password" ? Buttons.iconButton(Icon(isHidden ? Iconsax.eye_slash : Iconsax.eye, size: 26,), () => show()) : null,
            ),
            validator: (value) {
              if(value!.isEmpty){
                return null;
              }else if (!widget.regex.hasMatch(value)){
                return null;
              }
            },
          ),
        ),
        SizedBox(height: 7,)
      ],
    );
  }
}
