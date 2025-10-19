import 'package:flutter/material.dart';

class CustomToggle extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final double width;
  final double height;
  final Duration animationDuration;

  const CustomToggle({
    super.key,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.width = 50,
    this.height = 30,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.value) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(CustomToggle oldWidget) {
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
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: Color.lerp(
                widget.inactiveColor ?? Colors.grey.shade300,
                widget.activeColor ?? Theme.of(context).primaryColor,
                _animation.value,
              ),
              borderRadius: BorderRadius.circular(widget.height / 2),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: widget.animationDuration,
                  curve: Curves.easeInOut,
                  left: _animation.value * (widget.width - widget.height + 4),
                  top: 2,
                  child: Container(
                    width: widget.height - 4,
                    height: widget.height - 4,
                    decoration: BoxDecoration(
                      color: widget.thumbColor ?? Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
