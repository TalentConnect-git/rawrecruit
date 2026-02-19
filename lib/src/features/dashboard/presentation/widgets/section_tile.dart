import 'package:flutter/material.dart';

import '../../../../common/index.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: AppTextStyles.s16W600,
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String text;

  const CustomChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color:
            AppColors.primary.withOpacity(0.1),
        borderRadius:
            BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppTextStyles.s12W600
            .copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}