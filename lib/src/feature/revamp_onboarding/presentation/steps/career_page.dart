import 'package:flutter/material.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';

class CareerPage extends StatelessWidget {
  final VoidCallback onBack;

  const CareerPage({super.key, required this.onBack});

  /// ✅ FROM YOUR ORIGINAL FILE :contentReference[oaicite:0]{index=0}
  static const shiftOptions = [
    "Day",
    "Night",
    "Rotational",
    "Any",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: "Career",
      children: [
        /// 🔙 HEADER
        AppHeader(
          title: "Your Career",
          highlight: "details",
          onBack: onBack,
        ),

        const SizedBox(height: 10),

        const Text(
          "Help us get to know you more",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 16),

        /// 🔥 FIXED DROPDOWN
        AppDropdown(
          hint: "Open To Shift",
          options: shiftOptions,
        ),

        /// 🔥 INPUTS (FIXED)
        const AppInput("Current Salary"),
        const AppInput("Current Currency"),
        const AppInput("Expected Salary"),
        const AppInput("Expected Currency"),

        const SizedBox(height: 20),

        /// 🔥 KEEP THIS SECTION (AS YOU WANTED)
        const Text(
          "Certifications and more",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 10),

        const AppInput("About"),
           const SizedBox(height: 8),
   AppMultiSelectChips(
  label: "Certifications",
  options: [
    "AWS Certified",
    "Google Cloud",
    "Azure",
    "PMP",
    "Scrum Master",
    "Oracle",
    "Cisco",
    "Others",
  ],
),

        const SizedBox(height: 20),
      ],
    );
  }
}