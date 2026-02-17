import 'package:flutter/material.dart';

class DetailInfoTile extends StatelessWidget {
  final String title;
  final String value;
  final bool fullWidth;
  final bool isLarge;

  const DetailInfoTile({
    super.key,
    required this.title,
    required this.value,
    this.fullWidth = false,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: fullWidth || isLarge
              ? double.infinity
              : 150,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFEAEAEA),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
