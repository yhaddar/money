import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/utils/constant/images.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  PageController pageController = PageController();

  Rx<int> currentIndex = 0.obs;

  void updateIndex(index) => {
    if (currentIndex.value < Images.imagesOnboarding.length - 1)
      {currentIndex.value = index},
  };

  void nextPage(BuildContext context) {
    if (currentIndex.value < Images.imagesOnboarding.length - 1) {
      pageController.jumpToPage(currentIndex.value + 1);
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  void onInit() {
    pageController.addListener(
      () => currentIndex.value = pageController.page!.round(),
    );

    super.onInit();
  }
}
