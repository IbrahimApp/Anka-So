import 'package:flutter/material.dart';
import '../../../core/helpers/theme_helper.dart';

class ErrorWidget extends StatelessWidget {
  final String message;
  final String? title;
  final VoidCallback? onRetry;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;

  const ErrorWidget({
    super.key,
    required this.message,
    this.title,
    this.onRetry,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            ThemeHelper.error(context).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ThemeHelper.error(context).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon ?? Icons.error_outline,
            size: 48,
            color: textColor ?? ThemeHelper.error(context),
          ),
          const SizedBox(height: 16),
          if (title != null) ...[
            Text(
              title!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: textColor ?? ThemeHelper.error(context),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
          ],
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: textColor ?? ThemeHelper.error(context),
            ),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Réessayer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeHelper.error(context),
                foregroundColor: ThemeHelper.white(context),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
