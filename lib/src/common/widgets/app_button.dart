import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart' show AppTextStyles, AppColors;

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    this.label,
    this.icon,
    this.child,
    this.padding,
    this.foregroundColor,
    this.backgroundColor,
    this.circularRadius = 8,
    super.key,
  }) : _isOutlined = false;

  const AppButton.outlined({
    required this.onPressed,
    this.label,
    this.icon,
    this.child,
    this.padding,
    this.foregroundColor,
    this.backgroundColor,
    this.circularRadius = 8,
    super.key,
  }) : _isOutlined = true;

  final bool _isOutlined;

  final Widget? child;
  final String? label;
  final Widget? icon;
  final VoidCallback onPressed;

  final EdgeInsets? padding;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final double circularRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: padding ?? EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        foregroundColor: _isOutlined ? backgroundColor : foregroundColor,
        backgroundColor: _isOutlined ? foregroundColor : backgroundColor,
        side: _isOutlined
            ? BorderSide(color: backgroundColor ?? AppColors.secText)
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularRadius),
        ),
      ),
      child:
          child ??
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              ?icon,
              Text(label ?? '-', style: AppTextStyles.s16W600),
            ],
          ),
    );
  }
}
