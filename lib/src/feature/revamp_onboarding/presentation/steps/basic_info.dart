import 'package:flutter/material.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';
import '../widgets/input_widgets.dart';

class BasicPage extends StatelessWidget {
  final VoidCallback onBack;

  const BasicPage({super.key, required this.onBack});

  /// ✅ Use SAME options as original file
  static const genderOptions = [
    "Male",
    "Female",
    "Non-binary",
    "Prefer not to say",
  ];

  static const ethnicityOptions = [
    "Asian",
    "Black or African American",
    "Hispanic or Latino",
    "Native American or Alaska Native",
    "White",
    "Two or More Races",
    "Prefer not to say",
  ];

  static const maritalStatusOptions = [
    "Single",
    "Married",
    "Divorced",
    "Widowed",
    "Prefer not to say",
  ];

  static const visaStatusOptions = [
    "Citizen",
    "Permanent Resident",
    "Work Visa (e.g., H1B)",
    "Student Visa (e.g., F1)",
    "Not Authorized to Work",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: "Basic",
      children: [
        /// 🔙 HEADER
        AppHeader(
          title: "Your Professional",
          highlight: "details",
          onBack: onBack,
        ),

        const SizedBox(height: 10),

        const Text(
          "Add your information",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 16),

        /// 🔥 INPUTS
        const AppInput("Full Name"),
        const AppInput("Email"),
        const AppInput("Phone"),

        const SizedBox(height: 8),

        /// 🔽 DROPDOWNS (NOW CORRECT)
        AppDropdown(
          hint: "Gender",
          options: genderOptions,
        ),

        const AppInput("Date of Birth"),

        AppDropdown(
          hint: "Ethnicity",
          options: ethnicityOptions,
        ),

        AppDropdown(
          hint: "Marital Status",
          options: maritalStatusOptions,
        ),

        AppDropdown(
          hint: "Visa Status / Work Authorization",
          options: visaStatusOptions,
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}