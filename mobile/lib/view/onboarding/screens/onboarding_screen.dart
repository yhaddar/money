import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/utils/constant/size.dart';
import 'package:mobile/utils/constant/images.dart';
import 'package:mobile/utils/constant/color.dart';
import 'package:mobile/utils/constant/texts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Size.fullWidth(context),
            height: Size.fullHeight(context),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(Images.image1), fit: BoxFit.cover),
            ),
          ),

          Container(
            width: Size.fullWidth(context),
            height: Size.fullHeight(context),
            color: AllColors.black.withOpacity(0.7),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(Texts.titleOnboarding[0],
                  style: GoogleFonts.balsamiqSans(
                    color: AllColors.white,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10,),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 6),
                 child: Text(Texts.descriptionOnboarding[0],
                   textAlign: TextAlign.justify,
                   style: GoogleFonts.poppins(
                     color: AllColors.white.withOpacity(0.7),
                     fontSize: 15,
                   ),
                 ),
               ),
                SizedBox(height: 10,),
                Container(
                  width: Size.fullWidth(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            activeDotColor: AllColors.orange,
                            dotHeight: Size.height(10),
                            dotWidth: Size.width(11)
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AllColors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: Size.fullWidth(context),
                    height: Size.height(65),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent
                        ),
                        child: Text(Texts.buttonText, style: GoogleFonts.balsamiqSans(
                          color: AllColors.white,
                          fontSize: 21
                        ),)
                    ),
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
