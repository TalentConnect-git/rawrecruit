import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/onboarding_local_service.dart';

class WorkPrefPage extends StatefulWidget {
  final VoidCallback onBack;
  final User data;

  const WorkPrefPage({
    super.key,
    required this.onBack,
    required this.data,
  });

  @override
  State<WorkPrefPage> createState() => _WorkPrefPageState();

  static const employmentOptions = [
    "full time",
    "part time",
    "contract",
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
}

class _WorkPrefPageState extends State<WorkPrefPage> {
  String? employmentType;
  String? lookingFor;

  List<String> industry = [];
  List<String> jobRoles = [];
  List<String> languages = [];

  late TextEditingController locationCtrl;
  late TextEditingController expectedSalaryCtrl;
  late TextEditingController expectedCurrencyCtrl;

  bool isInitialized = false;

  String selectedState = "";

  List<String> states = [];
  List<String> cities = [];
  List<String> selectedCities = [];

  bool isLoadingStates = false;
  bool isLoadingCities = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isInitialized) return;

    final d =
        context.read<AppStateProvider>().data ??
        widget.data;

    expectedSalaryCtrl = TextEditingController(
      text: d.expectedSalaryAmount ?? '',
    );

    expectedCurrencyCtrl = TextEditingController(
      text:
          (d.expectedSalaryCurrency?.isNotEmpty ?? false)
              ? d.expectedSalaryCurrency!
              : '₹',
    );

    employmentType =
        (d.employmentType != null &&
                d.employmentType!.isNotEmpty)
            ? d.employmentType!.first
            : null;

    lookingFor =
        (d.lookingFor != null &&
                d.lookingFor!.isNotEmpty)
            ? d.lookingFor!.first
            : null;

    industry = List.from(d.industry ?? []);
    jobRoles = List.from(d.jobRoles ?? []);
    languages = List.from(d.languagesKnown ?? []);

    selectedCities = List.from(d.locations ?? []);

    locationCtrl = TextEditingController(
      text: selectedCities.join(", "),
    );

    fetchStates();

    loadSelectedState();

    isInitialized = true;
  }

  Future<void> loadSelectedState() async {
    final prefs =
        await SharedPreferences.getInstance();

    final savedState =
        prefs.getString("selected_state") ??
            "";

    if (!mounted) return;

    setState(() {
      selectedState = savedState;
    });

    if (savedState.isNotEmpty) {
      fetchCities(savedState);
    }
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
        final List stateList =
            res.data["data"]["states"];

        final loadedStates =
            stateList
                .map<String>(
                  (e) => e["name"].toString(),
                )
                .toList();

        setState(() {
          states = loadedStates;
        });
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

      if (res.statusCode == 200 &&
          res.data["data"] is List) {
        setState(() {
          cities = List<String>.from(
            res.data["data"],
          );
        });
      }
    } finally {
      setState(() => isLoadingCities = false);
    }
  }

  void saveData() {
    final currentUser =
        context.read<AppStateProvider>().data ??
        widget.data;

    final updatedUser = currentUser.copyWith(
      employmentType:
          employmentType != null
              ? [employmentType!]
              : [],

      lookingFor:
          lookingFor != null
              ? [lookingFor!]
              : [],

      industry: industry,

      jobRoles: jobRoles,

      languagesKnown: languages,

      locations: selectedCities,

      expectedSalaryAmount:
          expectedSalaryCtrl.text,

      expectedSalaryCurrency:
          expectedCurrencyCtrl.text,
    );

    context.read<AppStateProvider>().data =
        updatedUser;

    getIt<OnboardingLocalService>()
        .saveUser(updatedUser);
  }

  @override
  void dispose() {
    locationCtrl.dispose();
    expectedSalaryCtrl.dispose();
    expectedCurrencyCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: "Work Preferences",
      children: [
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

        AppDropdown(
          hint: "Employment Type",
          options:
              WorkPrefPage.employmentOptions,
          value: employmentType,
          onChanged: (val) {
            setState(() {
              employmentType = val;
            });

            saveData();
          },
        ),

        const SizedBox(height: 10),

        AppMultiSelectChips(
          label: "Industry",
          options:
              WorkPrefPage.industryOptions,
          initialValues: industry,
          onChanged: (val) {
            setState(() {
              industry = val;
            });

            saveData();
          },
        ),

        const SizedBox(height: 10),

        AppMultiSelectChips(
          label: "Job Roles",
          options:
              WorkPrefPage.jobRoleOptions,
          initialValues: jobRoles,
          onChanged: (val) {
            setState(() {
              jobRoles = val;
            });

            saveData();
          },
        ),

        const SizedBox(height: 10),

        AppDropdown(
          hint: "Looking For",
          options:
              WorkPrefPage.lookingForOptions,
          value: lookingFor,
          onChanged: (val) {
            setState(() {
              lookingFor = val;
            });

            saveData();
          },
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              flex: 2,
              child: AppDropdown(
                hint: "Curr",
                value:
                    expectedCurrencyCtrl
                            .text
                            .isEmpty
                        ? null
                        : expectedCurrencyCtrl
                            .text,
                options: const [
                  '\$',
                  '₹',
                  '€',
                  '£',
                ],
                onChanged: (val) {
                  setState(() {
                    expectedCurrencyCtrl.text =
                        val ?? "";
                  });

                  saveData();
                },
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              flex: 4,
              child: AppInput(
                "Expected Salary",
                controller:
                    expectedSalaryCtrl,
                onChanged:
                    (_) => saveData(),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        isLoadingStates
            ? const CircularProgressIndicator()
            : AppDropdown(
                hint: "Select State",
                options: states,
                value:
                    selectedState.isEmpty
                        ? null
                        : selectedState,
                onChanged: (val) async {
                  if (val == null) return;

                  final prefs =
                      await SharedPreferences.getInstance();

                  await prefs.setString(
                    "selected_state",
                    val,
                  );

                  setState(() {
                    selectedState = val;

                    selectedCities.clear();
                    cities.clear();
                    locationCtrl.clear();
                  });

                  saveData();

                  fetchCities(val);
                },
              ),

        const SizedBox(height: 10),

        if (selectedState.isNotEmpty)
          isLoadingCities
              ? const CircularProgressIndicator()
              : Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    AppDropdown(
                      hint: "Select City",
                      options: cities,
                      value: null,
                      onChanged: (val) {
                        if (val == null) {
                          return;
                        }

                        setState(() {
                          if (!selectedCities
                              .contains(val)) {
                            selectedCities
                                .add(val);
                          }

                          locationCtrl.text =
                              selectedCities
                                  .join(",");
                        });

                        saveData();
                      },
                    ),

                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          selectedCities.map((
                            city,
                          ) {
                            return Chip(
                              label: Text(city),

                              onDeleted: () {
                                setState(() {
                                  selectedCities
                                      .remove(city);

                                  locationCtrl
                                          .text =
                                      selectedCities
                                          .join(",");
                                });

                                saveData();
                              },
                            );
                          }).toList(),
                    ),
                  ],
                ),

        const SizedBox(height: 20),
      ],
    );
  }
}