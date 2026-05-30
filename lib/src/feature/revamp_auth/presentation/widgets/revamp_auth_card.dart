import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';

class ReAuthCard extends StatelessWidget {
  const ReAuthCard({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        /// 🔥 DARK CARD BACKGROUND
        color: AppColors.kCard,

        /// 🔥 ROUNDED (slightly more modern)
        borderRadius: BorderRadius.circular(20),

        /// 🔥 BORDER (important for dark UI)
        border: Border.all(
          color: AppColors.kBorder,
          width: 1,
        ),

        /// 🔥 SOFT GLOW (not ugly shadow)
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 20,
            spreadRadius: -5,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: child,
    );
  }
}