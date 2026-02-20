import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart' show AppColors;

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
    this.color,
    this.size,
    this.thickness,
    this.value,
  });

  final Color? color;
  final double? size;
  final double? thickness;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 60,
      width: size ?? 60,
      child: Center(
        child: CircularProgressIndicator(
          color: color ?? AppColors.primary,
          strokeWidth: thickness,
          value: value,
        ),
      ),
    );
  }
}
