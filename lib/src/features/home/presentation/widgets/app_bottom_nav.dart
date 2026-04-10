import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart' show AppColors, AppTextStyles;
import 'package:rawrecruit/src/core/index.dart'
    show AppStateProvider, NavItem, NavItemExt, getIt;
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    required this.currentIndex,
    required this.onTap,
    required this.hasUnread,
    super.key,
  });

  final void Function(NavItem index) onTap;
  final int currentIndex;
  final bool hasUnread;

  @override
  Widget build(BuildContext context) {
    // final items = getIt<AppStateProvider>().isProfessional
    //     ? NavItemExt.professionals
    //     : NavItemExt.freshers;

    final items = NavItem.values;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secText.withValues(alpha: 0.2),
          width: 0.4,
        ),
      ),
      child: StylishBottomBar(
        currentIndex: currentIndex,
        backgroundColor: AppColors.kBg,
        onTap: (index) => onTap(items[index]),
        items: [
          ...items.map((item) {
            final isSelected = items.indexOf(item) == currentIndex;

            Widget iconWidget = Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  isSelected ? item.selectedIcon : item.unSelectedIcon,
                  color: isSelected ? AppColors.kGreen : AppColors.secText,
                ),

                if (item == NavItem.chat && hasUnread)
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            );

            return BottomBarItem(
              icon: iconWidget,
              title: Text(
                item.label,
                style: AppTextStyles.s12W400.copyWith(
                  color: isSelected ? AppColors.kGreen : AppColors.secText,
                ),
              ),
            );
          }),
        ],
        option: AnimatedBarOptions(iconStyle: IconStyle.Default),
      ),
    );
  }
}
