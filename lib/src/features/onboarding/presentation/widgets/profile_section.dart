import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    required this.label,
    required this.children,
    this.trailing,
    this.spacing = 16,
    super.key,
  });

  final String label;
  final Widget? trailing;
  final List<Widget> children;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: AppColors.shadow, blurRadius: 1, spreadRadius: 1),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: spacing,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
Text(label, style: AppTextStyles.s18W600.copyWith(color: Colors.white), ),              ?trailing,
            ],
          ),
          ...children,
        ],
      ),
    );
  }
}
