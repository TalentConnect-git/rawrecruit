import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart'
    show User, Achievement, Award, Publication;
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';

import '../../../../core/provider/index.dart';
import '../widgets/wrapper.dart';

class AchievementsPage extends StatefulWidget {
  final VoidCallback onBack;
  final User data;

  const AchievementsPage({super.key, required this.onBack, required this.data});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  List<Achievement> achievements = [];
  List<Award> awards = [];
  List<Publication> publications = [];

  @override
  void initState() {
    super.initState();

    // achievements = widget.data.achievements ?? [];
    // awards = widget.data.awards ?? [];
    // publications = widget.data.publications ?? [];

    if (achievements.isEmpty) achievements.add(Achievement());
    if (awards.isEmpty) awards.add(Award());
    if (publications.isEmpty) publications.add(Publication());
  }
void saveData() {
  final currentUser =
      context.read<AppStateProvider>().data ?? widget.data;

  final filteredAchievements = achievements.where((e) {
    return (e.title?.trim().isNotEmpty ?? false) ||
        (e.event?.trim().isNotEmpty ?? false) ||
        (e.date?.trim().isNotEmpty ?? false);
  }).toList();

  final filteredAwards = awards.where((e) {
    return (e.title?.trim().isNotEmpty ?? false) ||
        (e.organization?.trim().isNotEmpty ?? false) ||
        (e.description?.trim().isNotEmpty ?? false);
  }).toList();

  final filteredPublications = publications.where((e) {
    return (e.title?.trim().isNotEmpty ?? false) ||
        (e.url?.trim().isNotEmpty ?? false);
  }).toList();

  final updatedUser = currentUser.copyWith(
    achievements: filteredAchievements,
    awards: filteredAwards,
    publications: filteredPublications,
  );

  context.read<AppStateProvider>().data = updatedUser;
}

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: "Achievements & More",
      children: [
        AppHeader(
          title: "Your professional",
          highlight: "Achievements",
          onBack: widget.onBack,
        ),

        const SizedBox(height: 10),

        const Text(
          "What makes you stand out?",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 16),

        /// 🔥 ACHIEVEMENTS
        _buildAchievements(),

        const SizedBox(height: 20),

        /// 🔥 AWARDS
        _buildAwards(),

        const SizedBox(height: 20),

        /// 🔥 PUBLICATIONS
        _buildPublications(),
      ],
    );
  }

  // =========================
  // ACHIEVEMENTS
  // =========================

  Widget _buildAchievements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Achievements", style: TextStyle(color: Colors.grey)),

        ...achievements.asMap().entries.map((entry) {
          int i = entry.key;
          var item = entry.value;

          return Column(
            children: [
              AppInput(
                "Title",
                controller: TextEditingController(text: item.title),
              onChanged: (v) {
  setState(() {
    achievements[i] = item.copyWith(title: v);
    saveData();
  });
}
              ),

              AppInput(
                "Event",
                controller: TextEditingController(text: item.event),
                onChanged: (v) {
achievements[i] = item.copyWith(event: v);                  saveData();
                },
              ),

              AppInput(
                "Date",
                controller: TextEditingController(text: item.date),
                onChanged: (v) {
achievements[i] = item.copyWith(date: v);                  saveData();
                },
              ),

              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        achievements.removeAt(i);
                        saveData();
                      });
                    },
                    child: const Text("Remove"),
                  ),
                ],
              ),

              const Divider(),
            ],
          );
        }),

        TextButton(
          onPressed: () {
            setState(() {
              achievements.add(Achievement());
            });
          },
          child: const Text("+ Add Achievement"),
        ),
      ],
    );
  }

  // =========================
  // AWARDS
  // =========================

  Widget _buildAwards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Awards", style: TextStyle(color: Colors.grey)),

        ...awards.asMap().entries.map((entry) {
          int i = entry.key;
          var item = entry.value;

          return Column(
            children: [
              AppInput(
                "Title",
                controller: TextEditingController(text: item.title),
                onChanged: (v) {
awards[i] = item.copyWith(title: v);                  saveData();
                },
              ),

              AppInput(
                "Organization",
                controller: TextEditingController(text: item.organization),
                onChanged: (v) {
            awards[i] = item.copyWith(organization: v);    
                  saveData();
                },
              ),

              AppInput(
                "Start Date",
                controller: TextEditingController(text: item.startDate),
                onChanged: (v) {
                  awards[i] = item.copyWith(startDate: v);    
                  saveData();
                },
              ),

              AppInput(
                "End Date",
                controller: TextEditingController(text: item.endDate),
                onChanged: (v) {
                      awards[i] = item.copyWith(endDate: v);    
                  saveData();
                },
              ),

              AppInput(
                "Description",
                controller: TextEditingController(text: item.description),
                onChanged: (v) {
     awards[i] = item.copyWith(description: v);                      saveData();
                },
              ),

              TextButton(
                onPressed: () {
                  setState(() {
                    awards.removeAt(i);
                    saveData();
                  });
                },
                child: const Text("Remove"),
              ),

              const Divider(),
            ],
          );
        }),

        TextButton(
          onPressed: () {
            setState(() {
              awards.add(Award());
            });
          },
          child: const Text("+ Add Award"),
        ),
      ],
    );
  }

  // =========================
  // PUBLICATIONS
  // =========================

  Widget _buildPublications() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Publications", style: TextStyle(color: Colors.grey)),

        ...publications.asMap().entries.map((entry) {
          int i = entry.key;
          var item = entry.value;

          return Column(
            children: [
              AppInput(
                "Title",
                controller: TextEditingController(text: item.title),
                onChanged: (v) {
publications[i] = item.copyWith(title: v);                  saveData();
                },
              ),

              AppInput(
                "URL",
                controller: TextEditingController(text: item.url),
                onChanged: (v) {
publications[i] = item.copyWith(url: v);                  saveData();
                },
              ),

              TextButton(
                onPressed: () {
                  setState(() {
                    publications.removeAt(i);
                    saveData();
                  });
                },
                child: const Text("Remove"),
              ),

              const Divider(),
            ],
          );
        }),

        TextButton(
          onPressed: () {
            setState(() {
              publications.add(Publication());
            });
          },
          child: const Text("+ Add Publication"),
        ),
      ],
    );
  }
}
