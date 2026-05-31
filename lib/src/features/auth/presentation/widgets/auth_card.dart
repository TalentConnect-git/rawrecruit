import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';

class AuthCard extends StatelessWidget {
  const AuthCard({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.kBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
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
