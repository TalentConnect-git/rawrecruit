import 'package:flutter/material.dart';

import '../../../../common/index.dart';

class InfoChip extends StatelessWidget {
  final String text;

  const InfoChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        border: Border.all(color: AppColors.white, width: 0.5),
        color: const Color(0xff222222),
      ),
      child: Text(
        text,
        style: AppTextStyles.s12W400.copyWith(color: AppColors.white),
      ),
    );
  }
}
