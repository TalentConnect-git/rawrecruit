import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/feature/onboarding/presentation/widgets/input_widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔙 HEADER
          AppHeader(
            title: "How do you want to",
            highlight: "use RawRecruit?",
            onBack: widget.onBack,
          ),

          const SizedBox(height: 24),

          /// 🔥 CARD 1
          _toggleCard(
            icon: Icons.person_add_alt_1,
            title: "Open to referrals",
            subtitle: "Let others find and refer you",
            value: openToReferrals,
            onChanged: (val) => setState(() => openToReferrals = val),
          ),

          const SizedBox(height: 16),

          /// 🔥 CARD 2
          _toggleCard(
            icon: Icons.group,
            title: "Open to referring others",
            subtitle: "Help candidates land roles at your company",
            value: openToReferring,
            onChanged: (val) => setState(() => openToReferring = val),
          ),

          const SizedBox(height: 16),

          /// 🔥 CARD 3
          _toggleCard(
            icon: Icons.work_outline,
            title: "Can post jobs from my company",
            subtitle: "Create job posts for your team's openings",
            value: canPostJobs,
            onChanged: (val) => setState(() => canPostJobs = val),
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
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
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

          /// SWITCH
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.kGreen,
          ),
        ],
      ),
    );
  }
}