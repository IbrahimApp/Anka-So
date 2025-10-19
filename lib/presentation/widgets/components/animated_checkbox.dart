import 'package:flutter/material.dart';

class AnimatedCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final double size;
  final Duration duration;

  const AnimatedCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.size = 24.0,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  State<AnimatedCheckbox> createState() => _AnimatedCheckboxState();
}

class _AnimatedCheckboxState extends State<AnimatedCheckbox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    if (widget.value) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(AnimatedCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged?.call(!widget.value),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: widget.value
                    ? (widget.activeColor ?? Theme.of(context).primaryColor)
                    : (widget.inactiveColor ?? Colors.grey.shade300),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: widget.value
                      ? (widget.activeColor ?? Theme.of(context).primaryColor)
                      : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: widget.value
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: widget.size * 0.6,
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
