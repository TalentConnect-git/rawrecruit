import 'package:flutter/material.dart';

import '../../../../common/index.dart';
import '../../../../common/theme/theme_controller.dart';

class InfoChip extends StatelessWidget {
  final String text;

  const InfoChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: ThemeController.instance.isDark
            ? const Color(0xFF222222)
            : AppColors.kTile,
        borderRadius: BorderRadius.circular(60),
        border: Border.all(
          color: ThemeController.instance.isDark
              ? AppColors.white.withOpacity(0.5)
              : const Color(0xFFE5E7EB),
          width: 1,
        ),
        boxShadow: ThemeController.instance.isDark
            ? []
            : [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Text(
        text,
        style: AppTextStyles.s12W400.copyWith(
          color: ThemeController.instance.isDark
              ? AppColors.secCard
              : AppColors.text,
        ),
      ),
    );
  }
}
