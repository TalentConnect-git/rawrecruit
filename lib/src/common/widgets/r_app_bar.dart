import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/theme/theme_controller.dart';

import '../index.dart' show AppColors, AppTextStyles;

class RAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RAppBar({
    super.key,
    this.label,
    this.leading,
    this.title,
    this.actions,
    this.iconTheme,
  });

  final String? label;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final IconThemeData? iconTheme;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeController.instance,
      builder: (_, __) {
        return AppBar(
          iconTheme: iconTheme,
          title:
              title ??
              Text(
                label ?? 'Referd',
                style: AppTextStyles.s16W600.copyWith(color: AppColors.white),
              ),
          backgroundColor: AppColors.kBg,
          scrolledUnderElevation: 0,
          titleSpacing: leading != null ? 0 : null,
          actions: actions,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
