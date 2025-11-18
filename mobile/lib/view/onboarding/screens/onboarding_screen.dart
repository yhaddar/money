import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/utils/constant/size.dart';
import 'package:mobile/utils/constant/images.dart';
import 'package:mobile/utils/constant/color.dart';
import 'package:mobile/utils/constant/texts.dart';
import 'package:mobile/view/onboarding/controller/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/constant/buttons.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController onboardingController = Get.put(
      OnboardingController(),
    );
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: onboardingController.pageController,
            onPageChanged: onboardingController.updateIndex,
            itemCount: Images.imagesOnboarding.length,
            itemBuilder: (context, index) => Stack(
              children: [
                Obx(
                  () => Container(
                    width: Size.fullWidth(context),
                    height: Size.fullHeight(context),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          Images.imagesOnboarding[onboardingController
                              .currentIndex
                              .value],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
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
                      Obx(
                        () => Text(
                          Texts.titleOnboarding[onboardingController
                              .currentIndex
                              .value],
                          style: GoogleFonts.balsamiqSans(
                            color: AllColors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Obx(
                        () => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            Texts.descriptionOnboarding[onboardingController
                                .currentIndex
                                .value],
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              color: AllColors.white.withOpacity(0.7),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 120),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(
                  width: Size.fullWidth(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() {
                        onboardingController.currentIndex.value;
                        return SmoothPageIndicator(
                          controller: onboardingController.pageController,
                          count: 3,
                          effect: ExpandingDotsEffect(
                            activeDotColor: AllColors.orange,
                            dotHeight: Size.height(10),
                            dotWidth: Size.width(11),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Obx(() {
                  onboardingController.currentIndex.value;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Buttons.elevatedButton(context, ()=> OnboardingController.instance.nextPage(context), onboardingController.currentIndex.value == 2 ? Texts.buttonText[1] : Texts.buttonText[0],)
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
