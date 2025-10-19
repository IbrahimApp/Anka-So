import 'package:flutter/material.dart';
import '../../../../core/helpers/theme_helper.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: currentPage == index ? 32 : 12,
          height: 12,
          decoration: BoxDecoration(
            color: currentPage == index
                ? ThemeHelper.primary(context)
                : ThemeHelper.lightGrey(context),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
