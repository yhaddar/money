import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/view/authentication/widgets/cover_widget.dart';
import 'package:mobile/view/authentication/widgets/register_widget.dart';

import '../../../utils/constant/buttons.dart';
import '../../../utils/constant/images.dart';
import '../../../utils/constant/texts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CoverWidget(image: Images.authenticationCover[1]),

              SizedBox(height: 10),
              RegisterWidget(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(Texts.changePagesAuthentication[1], style: GoogleFonts.poppins(),),
                  SizedBox(width: 0),
                  Buttons.textButton(Texts.authenticationButton[0], () => Navigator.pushReplacementNamed(context, "/login")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
