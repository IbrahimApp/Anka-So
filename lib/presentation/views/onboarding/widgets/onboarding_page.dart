import 'package:flutter/material.dart';
import '../onboarding_controller.dart';
import '../../../../core/helpers/theme_helper.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingPageModel page;

  const OnboardingPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration
          Expanded(
            flex: 3,
            child: Center(child: _buildIllustration(context, isDarkMode)),
          ),

          // Content
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  page.title,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? Colors.white
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Description
                Text(
                  page.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isDarkMode
                        ? Colors.white
                        : Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.87),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIllustration(BuildContext context, bool isDarkMode) {
    final primaryColor = isDarkMode
        ? Colors.white
        : ThemeHelper.primary(context);
    final secondaryColor = isDarkMode
        ? Colors.white.withValues(alpha: 0.3)
        : ThemeHelper.primary(context).withValues(alpha: 0.7);

    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        children: [
          // Person with magnifying glass
          Positioned(
            top: 80,
            left: 120,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Magnifying glass
          Positioned(
            top: 70,
            left: 140,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white : Colors.black,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDarkMode ? Colors.white : Colors.black,
                  width: 3,
                ),
              ),
            ),
          ),

          // Magnifying glass handle
          Positioned(
            top: 100,
            left: 170,
            child: Container(
              width: 20,
              height: 30,
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white : Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          // Houses in the background
          Positioned(
            top: 150,
            left: 50,
            child: _buildHouse(primaryColor, secondaryColor, isDarkMode),
          ),

          Positioned(
            top: 160,
            left: 100,
            child: _buildHouse(primaryColor, secondaryColor, isDarkMode),
          ),

          Positioned(
            top: 170,
            left: 150,
            child: _buildHouse(primaryColor, secondaryColor, isDarkMode),
          ),

          Positioned(
            top: 180,
            left: 200,
            child: _buildHouse(primaryColor, secondaryColor, isDarkMode),
          ),

          // Dollar sign in speech bubble
          Positioned(
            top: 120,
            left: 80,
            child: Container(
              width: 30,
              height: 20,
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: primaryColor, width: 2),
              ),
              child: Center(
                child: Text(
                  '\$',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHouse(
    Color primaryColor,
    Color secondaryColor,
    bool isDarkMode,
  ) {
    return SizedBox(
      width: 40,
      height: 30,
      child: Stack(
        children: [
          // House body
          Container(
            width: 40,
            height: 20,
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.white.withValues(alpha: 0.8)
                  : primaryColor.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          // Roof
          Positioned(
            top: 0,
            left: 5,
            child: Container(
              width: 30,
              height: 15,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.white.withValues(alpha: 0.6)
                    : secondaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          // Window
          Positioned(
            top: 8,
            left: 15,
            child: Container(
              width: 10,
              height: 8,
              decoration: BoxDecoration(
                color: isDarkMode ? primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
