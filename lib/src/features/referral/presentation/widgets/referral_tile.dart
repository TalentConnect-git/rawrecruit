import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/common/theme/app_colors.dart';

class ReferralTile extends StatelessWidget {
  const ReferralTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.kTile,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.white10,
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        spacing: 20,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xff3C321D),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.group, color: Color(0xffF7B23B)),
          ),
          Expanded(
            child: Text(
              'Go to Referrar Dashboard',
              style: AppTextStyles.s16W600.copyWith(color: Colors.white),
            ),
          ),
          Icon(Icons.keyboard_arrow_right, color: AppColors.secText),
        ],
      ),
    );
  }
}
