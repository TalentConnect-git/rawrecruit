import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';

class AuthCard extends StatelessWidget {
  const AuthCard({required this.child, super.key});
  final Column child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: AppColors.shadow, spreadRadius: 1)],
      ),
      child: child,
    );
  }
}
