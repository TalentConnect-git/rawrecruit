import 'package:flutter/material.dart';
class ProgressBar extends StatelessWidget {
  final int currentPage;
  final int total;

  const ProgressBar({required this.currentPage, required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: List.generate(total, (index) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 4,
              decoration: BoxDecoration(
                color: index <= currentPage
                    ? const Color(0xFF22C55E)
                    : Colors.grey.shade800,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }),
      ),
    );
  }
}