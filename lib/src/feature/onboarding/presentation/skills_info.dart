import 'package:flutter/material.dart';
import 'package:rawrecruit/src/feature/onboarding/presentation/widgets/input_widgets.dart';
import 'package:rawrecruit/src/feature/onboarding/presentation/widgets/wrapper.dart';

import '../../../common/index.dart';
class SkillsDomainPage extends StatefulWidget {

    final VoidCallback onBack;

  const SkillsDomainPage({super.key,required this.onBack});

  @override
  State<SkillsDomainPage> createState() => _SkillsDomainPageState();
}

class _SkillsDomainPageState extends State<SkillsDomainPage> {
  final TextEditingController searchCtrl = TextEditingController();

  List<String> selected = ["React", "TypeScript"];

  final List<String> popular = [
    "React", "Node.js", "Python", "TypeScript", "AWS",
    "Product Management", "System Design", "Java", "Go",
    "Kubernetes", "Machine Learning", "SQL", "Figma",
    "Data Science", "DevOps", "Rust", "Flutter", "Swift"
  ];

  void addSkill(String skill) {
    if (!selected.contains(skill)) {
      setState(() => selected.add(skill));
    }
  }

  void removeSkill(String skill) {
    setState(() => selected.remove(skill));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           AppHeader(title: "Your", highlight: "skills",onBack: widget.onBack),

          const SizedBox(height: 10),

          const Text(
            "Select or add your top skills",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 16),

          /// SEARCH FIELD
          TextField(
            controller: searchCtrl,
            style: const TextStyle(color: Colors.white),
            onSubmitted: (val) {
              if (val.trim().isNotEmpty) {
                addSkill(val.trim());
                searchCtrl.clear();
              }
            },
            decoration: InputDecoration(
              hintText: "Search or add a skill...",
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: AppColors.kCard,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// SELECTED CHIPS
          Wrap(
            spacing: 8,
            children: selected.map((skill) {
              return Chip(
                label: Text(skill),
                backgroundColor: const Color(0xFF22C55E) ,
                labelStyle: const TextStyle(color: Colors.black),
                deleteIcon: const Icon(Icons.close, size: 18),
                onDeleted: () => removeSkill(skill),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          const Text(
            "POPULAR SKILLS",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 10),

          /// POPULAR CHIPS
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: popular.map((skill) {
              final isSelected = selected.contains(skill);

              return GestureDetector(
                onTap: () => addSkill(skill),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF22C55E): AppColors.kCard,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    skill,
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}