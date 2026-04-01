import 'package:flutter/material.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';

class EducationPage extends StatefulWidget {
  final VoidCallback onBack;

  const EducationPage({super.key, required this.onBack});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  String? selectedDegree;
  String? selectedSpecialization;
  String? selectedSemester;
  String? selectedYear;

  /// 🔥 DEGREE OPTIONS
  final List<String> degreeOptions = [
    "B.Tech",
    "B.E",
    "Bachelor of Science",
    "BCA",
    "B.Com",
    "BA",
    "M.Tech",
    "M.E",
    "MSc",
    "MBA",
    "MCA",
    "PhD",
    "Diploma",
    "Other",
  ];

  /// 🔥 COMPLETE DEGREE → SPECIALIZATION MAP
  final Map<String, List<String>> specializationMap = {
    "B.Tech": [
      "Computer Science & Engineering",
      "Information Technology",
      "Electronics & Communication Engineering",
      "Electrical Engineering",
      "Mechanical Engineering",
      "Civil Engineering",
      "Data Science & AI",
      "Cybersecurity",
      "Other",
    ],
    "B.E": [
      "Computer Engineering",
      "Electronics Engineering",
      "Electrical Engineering",
      "Mechanical Engineering",
      "Civil Engineering",
      "Other",
    ],
    "Bachelor of Science": [
      "Computer Science",
      "Physics",
      "Chemistry",
      "Mathematics",
      "Biology",
      "Other",
    ],
    "BCA": [
      "Computer Applications",
      "Software Development",
      "Data Analytics",
      "Cloud Computing",
      "Other",
    ],
    "B.Com": [
      "Accounting & Finance",
      "Banking",
      "Taxation",
      "Other",
    ],
    "BA": [
      "English Literature",
      "History",
      "Political Science",
      "Psychology",
      "Other",
    ],
    "M.Tech": [
      "Computer Science",
      "Data Science",
      "AI",
      "Cybersecurity",
      "Other",
    ],
    "M.E": [
      "Computer Engineering",
      "Mechanical Engineering",
      "Civil Engineering",
      "Other",
    ],
    "MSc": [
      "Computer Science",
      "Physics",
      "Mathematics",
      "Data Science",
      "Other",
    ],
    "MBA": [
      "Finance",
      "Marketing",
      "Human Resources",
      "Operations",
      "Business Analytics",
      "Other",
    ],
    "MCA": [
      "Software Engineering",
      "Cloud Computing",
      "Artificial Intelligence",
      "Other",
    ],
    "PhD": [
      "Computer Science",
      "Engineering",
      "Management",
      "Other",
    ],
    "Diploma": [
      "Computer Engineering",
      "Mechanical",
      "Civil",
      "Electrical",
      "Other",
    ],
    "Other": ["Other"],
  };

  /// 🔥 SEMESTERS
  final List<String> semesterOptions =
      List.generate(8, (i) => "Semester ${i + 1}");

  /// 🔥 YEARS
  final List<String> graduationYears =
      List.generate(91, (i) => (1960 + i).toString());

  /// 🔥 SPECIALIZATION LOGIC (FIXED)
  List<String> getSpecializations() {
    if (selectedDegree == null) return ["Select degree first"];
    return specializationMap[selectedDegree!] ?? ["Other"];
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: "Education",
      children: [
        /// 🔙 HEADER
        AppHeader(
          title: "Your Educational",
          highlight: "details",
          onBack: widget.onBack,
        ),

        const SizedBox(height: 10),

        const Text(
          "What's your qualifications?",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 16),

        /// 🔥 COLLEGE
        const AppInput("College"),

        /// 🔥 DEGREE
        AppDropdown(
          hint: "Degree",
          options: degreeOptions,
          value: selectedDegree,
          onChanged: (val) {
            setState(() {
              selectedDegree = val;
              selectedSpecialization = null; // reset
            });
          },
        ),

        /// 🔥 SPECIALIZATION (DEPENDENT)
        AppDropdown(
          hint: selectedDegree == null
              ? "Select degree first"
              : "Specialization",
          options: getSpecializations(),
          value: selectedSpecialization,
          onChanged: selectedDegree == null
              ? null
              : (val) {
                  setState(() => selectedSpecialization = val);
                },
        ),

        /// 🔥 SEMESTER
        AppDropdown(
          hint: "Semester",
          options: semesterOptions,
          value: selectedSemester,
          onChanged: (val) => setState(() => selectedSemester = val),
        ),

        /// 🔥 GRADUATION YEAR
        AppDropdown(
          hint: "Graduation Year",
          options: graduationYears,
          value: selectedYear,
          onChanged: (val) => setState(() => selectedYear = val),
        ),

        /// 🔥 CGPA
        const AppInput("CGPA"),

        const SizedBox(height: 20),
      ],
    );
  }
}