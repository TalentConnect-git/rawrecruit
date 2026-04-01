import 'package:flutter/material.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';

class WorkPrefPage extends StatelessWidget {
  final VoidCallback onBack;

  const WorkPrefPage({super.key, required this.onBack});

  /// ✅ FROM YOUR ORIGINAL FILE :contentReference[oaicite:1]{index=1}
  static const employmentOptions = [
    "Full-time",
    "Part-time",
    "Contract",
    "Others",
  ];

  static const lookingForOptions = [
    "Internship",
    "Job",
    "Both",
  ];

  static const industryOptions = [
    "Technology",
    "Finance",
    "Healthcare",
    "Education",
    "Manufacturing",
    "Retail",
    "Automobile",
    "Construction",
    "Telecommunications",
    "Media",
    "Hospitality",
    "Pharmaceutical",
    "Energy",
    "Logistics",
    "Agriculture",
    "Others",
  ];

  static const jobRoleOptions = [
    "Software Developer",
    "Frontend Developer",
    "Backend Developer",
    "Full Stack Developer",
    "Mobile App Developer",
    "UI/UX Designer",
    "Data Analyst",
    "Data Scientist",
    "Machine Learning Engineer",
    "DevOps Engineer",
    "Cloud Architect",
    "QA Engineer",
    "Cyber Security Specialist",
    "Network Engineer",
    "Business Analyst",
    "Product Manager",
    "Project Manager",
    "HR Recruiter",
    "Marketing Specialist",
    "Sales Executive",
    "Finance Analyst",
    "Others",
  ];

  static const languageOptions = [
    "English",
    "Hindi",
    "Marathi",
    "Gujarati",
    "Tamil",
    "Telugu",
    "Kannada",
    "Malayalam",
    "Punjabi",
    "Bengali",
    "French",
    "German",
    "Spanish",
    "Japanese",
    "Chinese",
    "Others",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: "Work Preferences",
      children: [
        /// 🔙 HEADER
        AppHeader(
          title: "Your Work",
          highlight: "Preferences",
          onBack: onBack,
        ),

        const SizedBox(height: 10),

        const Text(
          "Help us know you better",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 20),

        /// 🔥 EMPLOYMENT TYPE (SINGLE SELECT)
        AppDropdown(
          hint: "Employment Type",
          options: employmentOptions,
        ),
        const SizedBox(height: 10),

        /// 🔥 INDUSTRY (MULTI SELECT)
        AppMultiSelectChips(
          label: "Industry",
          options: industryOptions,
        ),
        const SizedBox(height: 10),

        /// 🔥 JOB ROLES (MULTI SELECT)
        AppMultiSelectChips(
          label: "Job Roles",
          options: jobRoleOptions,
        ),
        const SizedBox(height: 10),

        /// 🔥 LOOKING FOR (SINGLE SELECT)
        AppDropdown(
          hint: "Looking For",
          options: lookingForOptions,
        ),

        const SizedBox(height: 10),

        /// 🔥 LOCATIONS (TEXT FOR NOW)
        const AppInput("Preferred Locations"),
SizedBox(height: 10,),
        /// 🔥 LANGUAGES (MULTI SELECT)
        AppMultiSelectChips(
          label: "Languages Known",
          options: languageOptions,
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}