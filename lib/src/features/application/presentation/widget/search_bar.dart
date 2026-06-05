import 'package:flutter/material.dart';

class ApplicationSearchBar extends StatelessWidget {
  const ApplicationSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.search),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "Search",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Icon(Icons.filter_alt_outlined),
        ],
      ),
    );
  }
}
