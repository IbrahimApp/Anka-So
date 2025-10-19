import 'package:ankaso/core/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'onboarding_controller.dart';
import '../../../../core/helpers/theme_helper.dart';
import '../../../../core/helpers/l10n_helper.dart';
import '../../../../core/constants/app_assets.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    AppSize size = AppSize(context);
    return Scaffold(
      backgroundColor: isDarkMode ? ThemeHelper.primary(context) : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              // Logo en haut à gauche
              SizedBox(
                height: 160,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Stack(
                    children: [
                      // Partie "Anka" en couleur primaire
                      SvgPicture.asset(
                        AppAssets.logoAnka,
                        width: 400,
                        height: 160,
                        colorFilter: ColorFilter.mode(
                          isDarkMode
                              ? Colors.white
                              : ThemeHelper.primary(context),
                          BlendMode.srcIn,
                        ),
                      ),
                      // Partie "So" en couleur fixe
                      SvgPicture.asset(
                        AppAssets.logoSo,
                        width: 400,
                        height: 160,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onSurface,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // PageView
              Expanded(
                child: PageView.builder(
                  key: const ValueKey('onboarding_pageview'),
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  itemCount: controller.pages.length,
                  itemBuilder: (context, index) {
                    return _buildOnboardingPage(
                      context,
                      controller.pages[index],
                      isDarkMode,
                      size,
                    );
                  },
                ),
              ),

              SizedBox(height: size.small),

              // Page indicators
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: controller.dotPage.value == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: controller.dotPage.value == index
                            ? ThemeHelper.primary(context)
                            : ThemeHelper.primary(
                                context,
                              ).withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: size.extraLarge * 2),

              // Button
              SizedBox(
                width: 340,
                child: ElevatedButton(
                  onPressed: controller.nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeHelper.primary(context),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(200, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    L10nHelper.of(context).getStarted,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: size.extraLarge),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(
    BuildContext context,
    OnboardingPageModel page,
    bool isDarkMode,
    AppSize size,
  ) {
    return Column(
      children: [
        // Titre aligné avec le logo
        Transform.translate(
          offset: const Offset(0, 0),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                page.title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: isDarkMode ? Colors.white : Colors.black,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 0),

        // Image
        Flexible(
          child: SvgPicture.asset(AppAssets.onboarding1, fit: BoxFit.contain),
        ),
      ],
    );
  }
}
