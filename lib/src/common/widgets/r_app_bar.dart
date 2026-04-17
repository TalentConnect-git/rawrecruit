import 'package:flutter/material.dart';

import '../index.dart' show AppColors, AppTextStyles;

class RAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RAppBar({
    super.key,
    this.label,
    this.leading,
    this.title,
    this.actions,
  });

  final String? label;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title:
          title ??
          Text(
            label ?? 'RawRecruit',
            style: AppTextStyles.s16W600.copyWith(color: AppColors.white),
          ),
      backgroundColor: AppColors.kBg,
      scrolledUnderElevation: 0,
      titleSpacing: leading != null ? 0 : null,
      actions: actions,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.25),
        child: Container(
          color: AppColors.border,
          width: double.maxFinite,
          height: 0.25,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
