import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({this.color, this.thickness, super.key});
  final Color? color;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.border,
      thickness: thickness ?? 0.5,
    );
  }
}
