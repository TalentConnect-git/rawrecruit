import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart' show AppColors, AppTextStyles;
import 'package:rawrecruit/src/core/index.dart' show UserType, UserTypeExt;

class RevampUserTypeCard extends StatelessWidget {
  const RevampUserTypeCard({
    required this.userType,
    required this.isSelected,
    super.key,
  });
  final UserType userType;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: AppColors.border, spreadRadius: 1)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            userType.label,
            style: AppTextStyles.s16W600.copyWith(
              color: isSelected ? Colors.white : AppColors.border,
            ),
          ),
        ],
      ),
    );
  }
}
