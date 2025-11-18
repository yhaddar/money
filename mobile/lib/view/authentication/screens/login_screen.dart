import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/view/authentication/widgets/cover_widget.dart';

import '../../../utils/constant/buttons.dart';
import '../../../utils/constant/images.dart';
import '../../../utils/constant/texts.dart';
import '../widgets/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CoverWidget(image: Images.authenticationCover[0]),

              SizedBox(height: 10),
              LoginWidget(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(Texts.changePagesAuthentication[0], style: GoogleFonts.poppins(),),
                  SizedBox(width: 6),
                  Buttons.textButton(Texts.authenticationButton[1], () => Navigator.pushReplacementNamed(context, "/register")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
