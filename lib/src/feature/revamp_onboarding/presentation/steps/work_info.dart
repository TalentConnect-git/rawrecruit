import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';
import 'package:dio/dio.dart';
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
selectedCities = List.from(d.locations ?? []);

fetchStates();
    lookingFor = (d.lookingFor != null && d.lookingFor!.isNotEmpty)
        ? d.lookingFor!.first
        : null;

    industry = List.from(d.industry ?? []);
    jobRoles = List.from(d.jobRoles ?? []);
    languages = List.from(d.languagesKnown ?? []);

    locationCtrl = TextEditingController(text: (d.locations ?? []).join(", "));
  }
  Future<void> fetchStates() async {
  try {
    setState(() => isLoadingStates = true);

    final res = await Dio().get(
      "https://countriesnow.space/api/v0.1/countries/states/q",
      queryParameters: {
        "country": "india",
      },
    );

    if (res.statusCode == 200 &&
        res.data["data"] != null &&
        res.data["data"]["states"] is List) {
      final List stateList = res.data["data"]["states"];

      states = stateList
          .map<String>((e) => e["name"].toString())
          .toList();
    }
  } finally {
    setState(() => isLoadingStates = false);
  }
}

Future<void> fetchCities(String state) async {
  try {
    setState(() {
      isLoadingCities = true;
      cities = [];
    });

    final res = await Dio().get(
      "https://countriesnow.space/api/v0.1/countries/state/cities/q",
      queryParameters: {
        "country": "india",
        "state": state.toLowerCase(),
      },
    );

    if (res.statusCode == 200 && res.data["data"] is List) {
      cities = List<String>.from(res.data["data"]);
    }
  } finally {
    setState(() => isLoadingCities = false);
  }
}
String selectedState = "";

List<String> states = [];
List<String> cities = [];
List<String> selectedCities = [];

bool isLoadingStates = false;
bool isLoadingCities = false;
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
       isLoadingStates
    ? const CircularProgressIndicator()
    : AppDropdown(
        hint: "Select State",
        options: states,
        value: selectedState.isEmpty ? null : selectedState,
        onChanged: (val) {
          setState(() {
            selectedState = val!;
          });

          if (val != null) {
  fetchCities(val);
}
        },
      ),

const SizedBox(height: 10),
if (selectedState.isNotEmpty)
  isLoadingCities
      ? const CircularProgressIndicator()
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// CITY DROPDOWN
            AppDropdown(
              hint: "Select City",
              options: cities,
              value: null,
              onChanged: (val) {
                if (val == null) return;

                setState(() {
                  if (!selectedCities.contains(val)) {
                    selectedCities.add(val);
                  }

                  locationCtrl.text =
                      selectedCities.join(",");

                  saveData();
                });
              },
            ),

            const SizedBox(height: 10),

            /// SELECTED CITY CHIPS
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: selectedCities.map((city) {
                return Chip(
                  label: Text(city),

                  onDeleted: () {
                    setState(() {
                      selectedCities.remove(city);

                      locationCtrl.text =
                          selectedCities.join(",");

                      saveData();
                    });
                  },
                );
              }).toList(),
            ),
          ],
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
