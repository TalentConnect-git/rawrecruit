import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';

import '../../revamp_onboarding/presentation/widgets/input_widgets.dart';

class PreferencesPage extends StatefulWidget {
  final VoidCallback onBack;

  const PreferencesPage({super.key, required this.onBack});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  bool openToReferrals = true;
  bool openToReferring = true;
  bool canPostJobs = true;

  UserType selectedType = UserType.student;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔙 HEADER
          AppHeader(
            title: "How do you want to",
            highlight: "use RawRecruit?",
            onBack: widget.onBack,
          ),

          ...UserType.values.map(
            (type) => _toggleCard(
              icon: type.icon,
              title: type.label,
              subtitle: type.desc,
              value: type == selectedType,
              onTap: () => setState(() => selectedType = type),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔥 REUSABLE CARD (matches your UI)
  Widget _toggleCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.kCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: value ? AppColors.kGreen : AppColors.kBorder,
          ),
        ),
        child: Row(
          children: [
            /// ICON BOX
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.kGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.black, size: 20),
            ),

            const SizedBox(width: 12),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
