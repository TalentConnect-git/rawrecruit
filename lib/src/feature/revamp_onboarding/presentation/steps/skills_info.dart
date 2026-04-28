import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';
import '../../../../common/index.dart';

class SkillsDomainPage extends StatefulWidget {
  final VoidCallback onBack;
  final User data;

  const SkillsDomainPage({super.key, required this.onBack, required this.data});

  @override
  State<SkillsDomainPage> createState() => _SkillsDomainPageState();
}

class _SkillsDomainPageState extends State<SkillsDomainPage> {
  final TextEditingController searchCtrl = TextEditingController();

  List<String> selected = [];

List<String> popular = [];
  @override
  void initState() {
    super.initState();
fetchSkills();
    /// 🔥 LOAD FROM SHARED DATA
    selected = List.from(widget.data.skills ?? []);
  }

  /// 🔥 SAVE TO SHARED DATA
  void saveData() {
    final currentUser = context.read<AppStateProvider>().data ?? widget.data;

    final updatedUser = currentUser.copyWith(skills: selected);

    context.read<AppStateProvider>().data = updatedUser;
  }

  /// 🔥 ADD SKILL
  void addSkill(String skill) {
    if (!selected.contains(skill)) {
      setState(() {
        selected.add(skill);
        saveData();
      });
    }
  }

  /// 🔥 REMOVE SKILL
  void removeSkill(String skill) {
    setState(() {
      selected.remove(skill);
      saveData();
    });
  }
Future<void> fetchSkills() async {
  final request = Request(
    method: RequestMethod.get,

    endpoint: "api/meta/get-skills",

    isSafeRoute: true,
  );

  try {
    final response =
        await getIt<NetworkService>()
            .request(request);

    final data =
        List<Map<String, dynamic>>.from(
          response.data,
        );

    setState(() {
      popular = data
          .map(
            (e) =>
                e['skills']
                    .toString(),
          )
          .toList();
    });
  } catch (_) {}
}

Future<void> addSkillToApi(
  String skill,
) async {
  final exists = popular.any(
    (e) =>
        e.toLowerCase().trim() ==
        skill
            .toLowerCase()
            .trim(),
  );

  if (exists) return;

  final request = Request(
    method: RequestMethod.post,

    endpoint: "api/meta/add-skill",

    isSafeRoute: true,

    body: {
      "skills": skill,
    },
  );

  try {
    await getIt<NetworkService>()
        .request(request);

    setState(() {
      popular.add(skill);
    });
  } catch (_) {}
}
  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔙 HEADER
            AppHeader(
              title: "Your",
              highlight: "skills",
              onBack: widget.onBack,
            ),

            const SizedBox(height: 10),

            const Text(
              "Select or add your top skills",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 16),

            /// 🔍 SEARCH FIELD
            TextField(
              controller: searchCtrl,
              style: const TextStyle(color: Colors.white),
             onSubmitted: (val) async {
  final skill = val.trim();

  if (skill.isEmpty) return;

  addSkill(skill);

  await addSkillToApi(skill);

  searchCtrl.clear();
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

            /// ✅ SELECTED SKILLS
            if (selected.isNotEmpty)
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: selected.map((skill) {
                  return Chip(
                    label: Text(skill),
                    backgroundColor: const Color(0xFF22C55E),
                    labelStyle: const TextStyle(color: Colors.black),
                    deleteIcon: const Icon(Icons.close, size: 18),
                    onDeleted: () => removeSkill(skill),
                  );
                }).toList(),
              ),

            const SizedBox(height: 20),

            const Text("POPULAR SKILLS", style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 10),

            /// 🔥 POPULAR SKILLS
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: popular.map((skill) {
                final isSelected = selected.contains(skill);

                return GestureDetector(
                  onTap: () {
                    if (isSelected) {
                      removeSkill(skill);
                    } else {
                      addSkill(skill);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF22C55E)
                          : AppColors.kCard,
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

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
