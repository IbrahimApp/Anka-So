import 'package:flutter/material.dart';

class UnifiedCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final Color? color;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final bool showShadow;

  const UnifiedCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.elevation,
    this.color,
    this.borderRadius,
    this.onTap,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(8),
      child: Material(
        elevation: showShadow ? (elevation ?? 2) : 0,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        color: color ?? Theme.of(context).cardColor,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          child: Container(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }
}
