import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart' show AppColors, AppTextStyles;
import 'package:rawrecruit/src/core/index.dart' show NavItem, NavItemExt;
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final void Function(int index) onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secText.withValues(alpha: 0.2),
          width: 0.4,
        ),
      ),
      child: StylishBottomBar(
        currentIndex: currentIndex,
        backgroundColor: AppColors.background,
        onTap: onTap,
        items: [
          ...NavItem.values.map((item) {
            Widget iconWidget = Icon(
              item.index == currentIndex
                  ? item.selectedIcon
                  : item.unSelectedIcon,
              color: AppColors.secText,
            );

            return BottomBarItem(
              icon: iconWidget,
              title: Text(
                item.label,
                style: AppTextStyles.s12W400.copyWith(color: AppColors.secText),
              ),
            );
          }),
        ],
        option: AnimatedBarOptions(iconStyle: IconStyle.Default),
      ),
    );
  }
}
