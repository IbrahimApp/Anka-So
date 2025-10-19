// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';

class AppCheckbox extends StatefulWidget {
  bool? checked;
  String title;
  Function(bool)? onChanged;
  Color? activeColor;
  List<TextSpan>? richTextSpans;
  AppCheckbox({
    super.key,
    this.onChanged,
    this.checked,
    required this.title,
    this.activeColor,
    this.richTextSpans,
  });

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  late bool checked;
  @override
  void initState() {
    super.initState();
    checked = widget.checked ?? false;
  }

  void toggleChecked() {
    setState(() {
      checked = !checked;
    });
    if (widget.onChanged != null) {
      widget.onChanged?.call(checked);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppSize size = AppSize(context);
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: toggleChecked,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SquareContainer(selected: checked, activeColor: widget.activeColor),
          SizedBox(width: size.medium * .7),
          Expanded(
            child: Opacity(
              opacity: .7,
              child: widget.richTextSpans != null
                  ? Text.rich(
                      TextSpan(children: widget.richTextSpans!),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : Text(
                      widget.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class SquareContainer extends StatelessWidget {
  bool selected;
  Color? activeColor;
  SquareContainer({super.key, required this.selected, this.activeColor});

  @override
  Widget build(BuildContext context) {
    AppSize size = AppSize(context);
    double circleRatio = size.medium * 1.3;
    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          height: circleRatio,
          width: circleRatio,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.small * .75),
            border: Border.all(
              color: selected
                  ? activeColor ?? AppColor.primary
                  : AppColor.primary,
              width: selected ? 2 : size.small * .15,
            ),
          ),
        ),
        Positioned.fill(
          child: AnimatedScale(
            scale: selected ? .7 : 0,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.small * .75),
                color: activeColor ?? AppColor.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
