import 'package:flutter/material.dart';

enum ToastType { success, error, warning, info }

class CustomToast {
  static OverlayEntry? _overlayEntry;

  static void show(
    BuildContext context, {
    required String message,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
  }) {
    _hide();

    final overlay = Overlay.of(context);
    final overlayState = overlay;

    _overlayEntry = OverlayEntry(
      builder: (context) => _ToastWidget(
        message: message,
        type: type,
        duration: duration,
        backgroundColor: backgroundColor,
        textColor: textColor,
        icon: icon,
        onDismiss: _hide,
      ),
    );

    overlayState.insert(_overlayEntry!);

    Future.delayed(duration, () {
      _hide();
    });
  }

  static void _hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  static void success(BuildContext context, String message) {
    show(
      context,
      message: message,
      type: ToastType.success,
      icon: Icons.check_circle,
    );
  }

  static void error(BuildContext context, String message) {
    show(context, message: message, type: ToastType.error, icon: Icons.error);
  }

  static void warning(BuildContext context, String message) {
    show(
      context,
      message: message,
      type: ToastType.warning,
      icon: Icons.warning,
    );
  }

  static void info(BuildContext context, String message) {
    show(context, message: message, type: ToastType.info, icon: Icons.info);
  }
}

class _ToastWidget extends StatefulWidget {
  final String message;
  final ToastType type;
  final Duration duration;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final VoidCallback onDismiss;

  const _ToastWidget({
    required this.message,
    required this.type,
    required this.duration,
    this.backgroundColor,
    this.textColor,
    this.icon,
    required this.onDismiss,
  });

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: -1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(widget.duration, () {
      _controller.reverse().then((_) => widget.onDismiss());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getBackgroundColor() {
    if (widget.backgroundColor != null) return widget.backgroundColor!;

    switch (widget.type) {
      case ToastType.success:
        return Colors.green;
      case ToastType.error:
        return Colors.red;
      case ToastType.warning:
        return Colors.orange;
      case ToastType.info:
        return Colors.blue;
    }
  }

  Color _getTextColor() {
    if (widget.textColor != null) return widget.textColor!;
    return Colors.white;
  }

  IconData _getIcon() {
    if (widget.icon != null) return widget.icon!;

    switch (widget.type) {
      case ToastType.success:
        return Icons.check_circle;
      case ToastType.error:
        return Icons.error;
      case ToastType.warning:
        return Icons.warning;
      case ToastType.info:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 16,
      right: 16,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _slideAnimation.value * 100),
            child: Opacity(
              opacity: _fadeAnimation.value,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                color: _getBackgroundColor(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(_getIcon(), color: _getTextColor(), size: 24),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.message,
                          style: TextStyle(
                            color: _getTextColor(),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.reverse().then((_) => widget.onDismiss());
                        },
                        child: Icon(
                          Icons.close,
                          color: _getTextColor(),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
