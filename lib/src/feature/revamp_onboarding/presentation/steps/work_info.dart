import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';

class WorkPrefPage extends StatefulWidget {
  final VoidCallback onBack;
  final User data;

  const WorkPrefPage({super.key, required this.onBack, required this.data});

  @override
  State<WorkPrefPage> createState() => _WorkPrefPageState();

  static const employmentOptions = [
    "Full-time",
    "Part-time",
    "Contract",
    "Others",
  ];

  static const lookingForOptions = ["Internship", "Job", "Both"];

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
}

class _WorkPrefPageState extends State<WorkPrefPage> {
  String? employmentType;
  String? lookingFor;

  List<String> industry = [];
  List<String> jobRoles = [];
  List<String> languages = [];

  late TextEditingController locationCtrl;

  @override
  void initState() {
    super.initState();

final d = widget.data;
    employmentType = (d.employmentType != null && d.employmentType!.isNotEmpty)
        ? d.employmentType!.first
        : null;

    lookingFor = (d.lookingFor != null && d.lookingFor!.isNotEmpty)
        ? d.lookingFor!.first
        : null;

    industry = List.from(d.industry ?? []);
    jobRoles = List.from(d.jobRoles ?? []);
    languages = List.from(d.languagesKnown ?? []);

    locationCtrl = TextEditingController(text: (d.locations ?? []).join(", "));
  }

  void saveData() {
     final currentUser =
      context.read<AppStateProvider>().data ?? widget.data;

  final updatedUser = currentUser.copyWith(
      employmentType: employmentType != null ? [employmentType!] : [],
      lookingFor: lookingFor != null ? [lookingFor!] : [],
      industry: industry,
      jobRoles: jobRoles,
      languagesKnown: languages,
      locations: locationCtrl.text
          .split(",")
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList(),
    );

    context.read<AppStateProvider>().data = updatedUser;
  }

  @override
  void dispose() {
    locationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: "Work Preferences",
      children: [
        /// HEADER
        AppHeader(
          title: "Your Work",
          highlight: "Preferences",
          onBack: widget.onBack,
        ),

        const SizedBox(height: 10),

        const Text(
          "Help us know you better",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 20),

        /// EMPLOYMENT TYPE
        AppDropdown(
          hint: "Employment Type",
          options: WorkPrefPage.employmentOptions,
          value: employmentType,
          onChanged: (val) {
            setState(() {
              employmentType = val;
              saveData();
            });
          },
        ),

        const SizedBox(height: 10),

        /// INDUSTRY
        AppMultiSelectChips(
          label: "Industry",
          options: WorkPrefPage.industryOptions,
          initialValues: industry,
          onChanged: (val) {
            industry = val;
            saveData();
          },
        ),

        const SizedBox(height: 10),

        /// JOB ROLES
        AppMultiSelectChips(
          label: "Job Roles",
          options: WorkPrefPage.jobRoleOptions,
          initialValues: jobRoles,
          onChanged: (val) {
            jobRoles = val;
            saveData();
          },
        ),

        const SizedBox(height: 10),

        /// LOOKING FOR
        AppDropdown(
          hint: "Looking For",
          options: WorkPrefPage.lookingForOptions,
          value: lookingFor,
          onChanged: (val) {
            setState(() {
              lookingFor = val;
              saveData();
            });
          },
        ),

        const SizedBox(height: 10),

        /// LOCATIONS
        AppInput(
          "Preferred Locations (comma separated)",
          controller: locationCtrl,
          onChanged: (_) => saveData(),
        ),

        const SizedBox(height: 10),

        /// LANGUAGES
        AppMultiSelectChips(
          label: "Languages Known",
          options: WorkPrefPage.languageOptions,
          initialValues: languages,
          onChanged: (val) {
            languages = val;
            saveData();
          },
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
