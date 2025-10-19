import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/helpers/l10n_helper.dart';
import '../../../app/routes/app_routes.dart';
import 'widgets/terms_modal.dart';

class OnboardingPageModel {
  final String title;
  final String description;
  final String image;

  OnboardingPageModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingController extends GetxController {
  final StorageService _storageService = Get.find();

  late PageController pageController;
  final RxInt currentPage = 0.obs;
  final RxInt dotPage = 0.obs;

  List<OnboardingPageModel> get pages => [
    OnboardingPageModel(
      title: L10nHelper.of(Get.context!).findYourIdealHome,
      description: L10nHelper.of(Get.context!).findYourIdealHomeDescription,
      image: 'assets/images/onboarding_1.png',
    ),
    OnboardingPageModel(
      title: L10nHelper.of(Get.context!).searchByYourCriteria,
      description: L10nHelper.of(Get.context!).searchByYourCriteriaDescription,
      image: 'assets/images/onboarding_1.png',
    ),
    OnboardingPageModel(
      title: L10nHelper.of(Get.context!).bookYourNewHome,
      description: L10nHelper.of(Get.context!).bookYourNewHomeDescription,
      image: 'assets/images/onboarding_1.png',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int page) {
    currentPage.value = page;
    // Les dots ne changent que lors du défilement manuel
    dotPage.value = page;
  }

  void nextPage() {
    showTermsModal();
  }

  void showTermsModal() {
    Get.bottomSheet(
      TermsModal(
        onAccept: () {
          Get.back(); // Fermer le modal
          completeOnboarding();
        },
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  void previousPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipOnboarding() {
    completeOnboarding();
  }

  void completeOnboarding() {
    _storageService.setOnboardingCompleted(true);
    Get.offAllNamed(Routes.login);
  }
}
