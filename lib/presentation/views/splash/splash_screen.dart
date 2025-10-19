import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart';
import 'package:get/get.dart';
import '../../../core/helpers/theme_helper.dart';
import '../../../core/constants/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _fillAnimation;
  late Animation<double> _logoTransitionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    // Animation d'opacité pour l'apparition du logo
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // Animation de remplissage
    _fillAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Animation de transition entre les logos
    _logoTransitionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward().then((_) {
      // Navigation vers l'onboarding après l'animation
      Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) return;
        Get.offAllNamed('/onboarding');
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          // Animation de remplissage (en arrière-plan)
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..translateByVector3(
                      Vector3(
                        MediaQuery.of(context).size.width * 0.5 - 60,
                        MediaQuery.of(context).size.height * 0.5 - 60,
                        0,
                      ),
                    )
                    ..rotateZ(-30 * 3.14159 / 180)
                    ..scaleByVector3(Vector3.all(_fillAnimation.value * 4)),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CustomPaint(
                      size: Size(
                        MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height,
                      ),
                      painter: WavePainter(
                        color: ThemeHelper.primary(context),
                        animation: _fillAnimation.value,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Logo avec transition
          Center(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: AnimatedBuilder(
                animation: _logoTransitionAnimation,
                builder: (context, child) {
                  return Stack(
                    children: [
                      Opacity(
                        opacity: 1 - _logoTransitionAnimation.value,
                        child: Stack(
                          children: [
                            // Partie "Anka" en couleur primaire
                            SvgPicture.asset(
                              AppAssets.logoAnka,
                              width: 300,
                              height: 300,
                              colorFilter: ColorFilter.mode(
                                ThemeHelper.primary(context),
                                BlendMode.srcIn,
                              ),
                            ),
                            // Partie "So" en couleur fixe
                            SvgPicture.asset(
                              AppAssets.logoSo,
                              width: 300,
                              height: 300,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.onSurface,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Opacity(
                        opacity: _logoTransitionAnimation.value,
                        child: SvgPicture.asset(
                          AppAssets.logoBlanc,
                          width: 300,
                          height: 300,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final Color color;
  final double animation;

  WavePainter({required this.color, required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);

    // Création de l'effet de vague
    for (double i = 0; i <= size.width; i++) {
      final x = i;
      final y =
          size.height * (1 - animation) +
          math.sin((i / size.width) * 2 * math.pi * 3) * 20 * animation;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) =>
      animation != oldDelegate.animation;
}
