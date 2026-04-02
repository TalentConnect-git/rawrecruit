import 'package:flutter/material.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';
import '../../data/revamp_entities/achievement_model.dart';
import '../../data/revamp_entities/award_model.dart';
import '../../data/revamp_entities/onboarding_model.dart';
import '../../data/revamp_entities/publication_model.dart';
import '../widgets/wrapper.dart';

class AchievementsPage extends StatefulWidget {
  final VoidCallback onBack;
  final OnboardingData data;

  const AchievementsPage({
    super.key,
    required this.onBack,
    required this.data,
  });

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  List<AchievementModel> achievements = [];
  List<AwardModel> awards = [];
  List<PublicationModel> publications = [];

  @override
  void initState() {
    super.initState();

    achievements = widget.data.achievements;
    awards = widget.data.awards;
    publications = widget.data.publications;

    if (achievements.isEmpty) achievements.add(AchievementModel());
    if (awards.isEmpty) awards.add(AwardModel());
    if (publications.isEmpty) publications.add(PublicationModel());
  }

  void saveData() {
    widget.data.achievements = achievements;
    widget.data.awards = awards;
    widget.data.publications = publications;
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
        const Text("Achievements",
            style: TextStyle(color: Colors.grey)),

        ...achievements.asMap().entries.map((entry) {
          int i = entry.key;
          var item = entry.value;

          return Column(
            children: [
              AppInput("Title",
                  controller: TextEditingController(text: item.title),
                  onChanged: (v) {
                    item.title = v;
                    saveData();
                  }),

              AppInput("Event",
                  controller: TextEditingController(text: item.event),
                  onChanged: (v) {
                    item.event = v;
                    saveData();
                  }),

              AppInput("Date",
                  controller: TextEditingController(text: item.date),
                  onChanged: (v) {
                    item.date = v;
                    saveData();
                  }),

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
              achievements.add(AchievementModel());
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
              AppInput("Title",
                  controller: TextEditingController(text: item.title),
                  onChanged: (v) {
                    item.title = v;
                    saveData();
                  }),

              AppInput("Organization",
                  controller:
                      TextEditingController(text: item.organization),
                  onChanged: (v) {
                    item.organization = v;
                    saveData();
                  }),

              AppInput("Start Date",
                  controller:
                      TextEditingController(text: item.startDate),
                  onChanged: (v) {
                    item.startDate = v;
                    saveData();
                  }),

              AppInput("End Date",
                  controller:
                      TextEditingController(text: item.endDate),
                  onChanged: (v) {
                    item.endDate = v;
                    saveData();
                  }),

              AppInput("Description",
                  controller:
                      TextEditingController(text: item.description),
                  onChanged: (v) {
                    item.description = v;
                    saveData();
                  }),

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
              awards.add(AwardModel());
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
        const Text("Publications",
            style: TextStyle(color: Colors.grey)),

        ...publications.asMap().entries.map((entry) {
          int i = entry.key;
          var item = entry.value;

          return Column(
            children: [
              AppInput("Title",
                  controller: TextEditingController(text: item.title),
                  onChanged: (v) {
                    item.title = v;
                    saveData();
                  }),

              AppInput("URL",
                  controller: TextEditingController(text: item.url),
                  onChanged: (v) {
                    item.url = v;
                    saveData();
                  }),

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
              publications.add(PublicationModel());
            });
          },
          child: const Text("+ Add Publication"),
        ),
      ],
    );
  }
}