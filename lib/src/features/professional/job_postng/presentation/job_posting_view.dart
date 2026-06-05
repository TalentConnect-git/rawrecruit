import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/view_model/job_posting_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/index.dart';

class ReferralPostView extends StatefulWidget {
  const ReferralPostView({super.key});

  @override
  State<ReferralPostView> createState() => _ReferralPostViewState();
}

class _ReferralPostViewState extends State<ReferralPostView> {
  final ReferralPostViewModel referralPostViewModel = ReferralPostViewModel();
  final _formKey = GlobalKey<FormState>();
  static const draftKey = "referral_post_draft";
  List<String> skillOptionsApi = [];

  @override
  void initState() {
    super.initState();
    fetchStates();
    fetchSkills();
    loadDraft();
  }

  Future<void> fetchSkills() async {
    final response = await getIt<NetworkService>().request(
      Request(
        method: RequestMethod.get,
        endpoint: "api/meta/get-skills",
        isSafeRoute: true,
      ),
    );

    final data = List<Map<String, dynamic>>.from(response.data);

    skillOptionsApi = [...data.map((e) => e['skills'].toString()), "Others"];

    setState(() {});
  }

  int get maxSelectionProcessCount {
    final roundsText = roundsController.text;

    final match = RegExp(r'\d+').firstMatch(roundsText);

    if (match == null) {
      return 999;
    }

    return int.tryParse(match.group(0) ?? '') ?? 999;
  }

  // Text controllers
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final openingsController = TextEditingController();
  final eligibilityController = TextEditingController();

  // Chip multi-select controllers (comma-separated)
  final skillsController = TextEditingController();
  final certificationsController = TextEditingController();
  final benefitsController = TextEditingController();
  final fieldOfStudyController = TextEditingController();

  // Package detail controllers
  final currencyController = TextEditingController(text: 'INR');
  final totalCTCController = TextEditingController();
  final fixedPayController = TextEditingController();
  final joiningBonusController = TextEditingController();

  // Dropdowns
  // String selectedJobTitle = "Software Developer";
  String? employmentType;
  String? workMode;
  String? broadcastType;
  String? minEducation;
  String? workAuthorization;
  String? experienceRange;
  String selectedState = "";
  String selectedCity = "";

  List<String> states = [];
  List<String> cities = [];

  bool isLoadingStates = false;
  bool isLoadingCities = false;
  // Tags — enum only, multi-select via Set
  final Set<String> selectedTags = {};

  final PageController _pageController = PageController();

  int currentStep = 0;

  final int totalSteps = 9;

  void nextStep() {
    if (currentStep < totalSteps - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> saveDraft() async {
    final prefs = await SharedPreferences.getInstance();

    final data = {
      "title": titleController.text,
      "description": descriptionController.text,
      "eligibility": eligibilityController.text,
      "openings": openingsController.text,
      "skills": skillsController.text,
      "certifications": certificationsController.text,
      "benefits": benefitsController.text,
      "stream": fieldOfStudyController.text,
      "currency": currencyController.text,
      "totalCTC": totalCTCController.text,
      "fixedPay": fixedPayController.text,
      "bonus": joiningBonusController.text,
      "employmentType": employmentType,
      "workMode": workMode,
      "broadcastType": broadcastType,
      "minEducation": minEducation,
      "workAuthorization": workAuthorization,
      "experienceRange": experienceRange,
      "selectedState": selectedState,
      "selectedCity": selectedCity,
      "rounds": roundsController.text,
      "selectionProcess": selectionProcessController.text,
      "endDate": endDateController.text,
      "minExperience": minExperienceController.text,
      "tags": selectedTags.toList(),
      "currentStep": currentStep,
    };

    await prefs.setString(draftKey, jsonEncode(data));
  }

  Future<void> loadDraft() async {
    final prefs = await SharedPreferences.getInstance();

    final raw = prefs.getString(draftKey);

    if (raw == null) return;

    final data = jsonDecode(raw);

    titleController.text = data["title"] ?? "";
    descriptionController.text = data["description"] ?? "";
    eligibilityController.text = data["eligibility"] ?? "";
    openingsController.text = data["openings"] ?? "";
    skillsController.text = data["skills"] ?? "";
    certificationsController.text = data["certifications"] ?? "";
    benefitsController.text = data["benefits"] ?? "";
    fieldOfStudyController.text = data["stream"] ?? "";
    currencyController.text = data["currency"] ?? "INR";
    totalCTCController.text = data["totalCTC"] ?? "";
    fixedPayController.text = data["fixedPay"] ?? "";
    joiningBonusController.text = data["bonus"] ?? "";
    roundsController.text = data["rounds"] ?? "";
    selectionProcessController.text = data["selectionProcess"] ?? "";
    endDateController.text = data["endDate"] ?? "";
    minExperienceController.text = data["minExperience"] ?? "";
    employmentType = data["employmentType"];

    workMode = data["workMode"];

    broadcastType = data["broadcastType"];

    minEducation = data["minEducation"];

    workAuthorization = data["workAuthorization"];

    experienceRange = data["experienceRange"];

    selectedState = data["selectedState"] ?? "";

    selectedCity = data["selectedCity"] ?? "";

    currentStep = data["currentStep"] ?? 0;

    final tags = List<String>.from(data["tags"] ?? []);

    selectedTags.clear();
    selectedTags.addAll(tags);

    setState(() {});

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(currentStep);
    });
  }

  Future<void> addSkillIfNeeded(String value) async {
    final exists = skillOptionsApi.any(
      (e) => e.toLowerCase().trim() == value.toLowerCase().trim(),
    );

    if (exists) return;

    await getIt<NetworkService>().request(
      Request(
        method: RequestMethod.post,
        endpoint: "/api/meta/add-skill",
        isSafeRoute: true,
        body: {"skills": value},
      ),
    );

    await fetchSkills();
  }

  void previousStep() async {
    await saveDraft();

    if (currentStep > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> fetchStates() async {
    try {
      setState(() => isLoadingStates = true);

      final res = await Dio().get(
        "https://countriesnow.space/api/v0.1/countries/states/q",
        queryParameters: {"country": "india"},
      );

      print("STATE DATA: ${res.data}");

      if (res.statusCode == 200 &&
          res.data["data"] != null &&
          res.data["data"]["states"] is List) {
        final List stateList = res.data["data"]["states"];

        states = stateList.map((e) => e["name"].toString()).toList();
      }
    } catch (e) {
      print("STATE API ERROR: $e");
    } finally {
      setState(() => isLoadingStates = false);
    }
  }

  Future<void> fetchCities(String state) async {
    try {
      setState(() {
        isLoadingCities = true;
        cities = [];
        selectedCity = "";
      });

      final res = await Dio().get(
        "https://countriesnow.space/api/v0.1/countries/state/cities/q",
        queryParameters: {"country": "india", "state": state.toLowerCase()},
      );

      print("CITY DATA: ${res.data}");

      if (res.statusCode == 200 && res.data["data"] is List) {
        cities = List<String>.from(res.data["data"]);
      }
    } catch (e) {
      print("CITY API ERROR: $e");
    } finally {
      setState(() => isLoadingCities = false);
    }
  }

  // ── Enum options ────────────────────────────────────────────────────────────

  final List<String> jobTitleOptions = [
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
  ];

  final List<String> skillOptions = [
    'Flutter',
    'Dart',
    'React',
    'Node.js',
    'Python',
    'Java',
    'TypeScript',
    'JavaScript',
    'HTML',
    'CSS',
    'SQL',
    'MongoDB',
    'Firebase',
    'AWS',
    'Docker',
    'Kubernetes',
    'Git',
    'REST API',
    'GraphQL',
  ];

  final List<String> certificationOptions = [
    'AWS Certified',
    'Microsoft Certified',
    'Google Cloud Certified',
    'Cisco Certified',
    'PMP',
    'CFA',
    'CISSP',
    'Scrum Master',
  ];

  final List<String> benefitOptions = [
    'Health Insurance',
    '401(k)',
    'Paid Time Off',
    'Flexible Schedule',
    'Dental Insurance',
    'Vision Insurance',
    'Remote Work',
    'Stock Options',
    'Learning Budget',
    'Gym Membership',
  ];

  // ── fieldOfStudyOptions — dynamic getter based on minEducation ────────────
  List<String> get fieldOfStudyOptions {
    switch (minEducation) {
      /// HIGH SCHOOL
      case "High School":
        return [
          'Science Stream',
          'Commerce Stream',
          'Arts Stream',
          'Vocational',
        ];

      /// BACHELOR DEGREES
      case "B.Tech":
      case "B.E":
        return [
          'Computer Engineering',
          'Mechanical Engineering',
          'Civil Engineering',
          'Electrical Engineering',
          'Electronics & Communication',
          'Information Technology',
          'Artificial Intelligence',
        ];

      case "B.Sc":
        return [
          'Computer Science',
          'Mathematics',
          'Physics',
          'Chemistry',
          'Biotechnology',
          'Data Science',
        ];

      case "B.Com":
        return ['Accounting', 'Finance', 'Banking', 'Taxation', 'Economics'];

      case "B.A":
        return [
          'English',
          'History',
          'Political Science',
          'Sociology',
          'Psychology',
          'Economics',
          'Law',
        ];

      case "BBA":
        return [
          'Marketing',
          'Finance',
          'Human Resources',
          'International Business',
          'Operations',
          'Entrepreneurship',
        ];

      /// MASTER DEGREES
      case "M.Tech":
        return [
          'Computer Engineering',
          'Software Engineering',
          'Data Science',
          'AI & ML',
          'Structural Engineering',
        ];

      case "M.Sc":
        return [
          'Computer Science',
          'Mathematics',
          'Physics',
          'Chemistry',
          'Biotechnology',
          'Data Science',
        ];

      case "M.Com":
        return ['Accounting', 'Finance', 'Banking', 'Economics', 'Taxation'];

      case "MBA":
        return [
          'Marketing',
          'Finance',
          'Human Resources',
          'Operations',
          'Business Analytics',
          'International Business',
        ];

      case "MCA":
        return [
          'Software Development',
          'Data Science',
          'AI & ML',
          'Cyber Security',
          'Cloud Computing',
        ];

      case "M.Pharm":
        return [
          'Pharmaceutics',
          'Pharmacology',
          'Pharmaceutical Chemistry',
          'Quality Assurance',
        ];

      /// PhD
      case "PhD":
        return [
          'Computer Science',
          'Engineering',
          'Mathematics',
          'Physics',
          'Life Sciences',
          'Economics',
          'Medicine',
          'Social Sciences',
          'Humanities',
        ];

      /// Diploma
      case "Postgraduate Diploma":
        return [
          'Management',
          'Data Science',
          'Cyber Security',
          'Finance',
          'Marketing',
        ];

      default:
        return ['Others'];
    }
  }

  final List<String> tagOptions = [
    "Urgent hiring",
    "Fresher preferred",
    "Remote-friendly",
    "Work from Home",
  ];

  final List<String> indiaCities = [
    "Mumbai",
    "Delhi",
    "Bangalore",
    "Hyderabad",
    "Chennai",
    "Pune",
    "Kolkata",
    "Ahmedabad",
    "Jaipur",
    "Surat",
  ];

  final List<String> educationOptions = [
    "High School",

    // Bachelor's
    "B.A",
    "B.Com",
    "B.E",
    "B.Sc",
    "B.Tech",
    "BBA",

    // Master's
    "M.Com",
    "M.Sc",
    "M.Tech",
    "MBA",
    "MCA",
    "M.Pharm",

    // Higher
    "PhD",
    "Postgraduate Diploma",
  ];
  final roundsController = TextEditingController();

  final selectionProcessController = TextEditingController();

  final endDateController = TextEditingController();

  final minExperienceController = TextEditingController();
  final List<String> experienceOptions = [
    "0-1 years",
    "1-3 years",
    "3-5 years",
    "5-10 years",
    "10+ years"
  ];
  final List<String> roundsOptions = [
    "1 Round",
    "2 Rounds",
    "3 Rounds",
    "4 Rounds",
    "5 Rounds",
    "6 Rounds",
    "7+ Rounds",
  ];
  final List<String> selectionProcessOptions = [
    "Aptitude Test 1",
    "Case Study 1",
    "Coding Test 1",
    "Group Discussion 1",
    "HR Interview 1",
    "Online Test 1",
    "Presentation 1",
    "Technical Interview 1",
  ];

  Widget _chipMultiSelectField(
    String label,
    TextEditingController controller,
    List<String> options,
  ) {
    return _ChipMultiSelectField(
      key: ValueKey(label),
      label: label,
      controller: controller,
      options: options,
    );
  }

  Future<void> pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      endDateController.text =
          "${picked.year}-"
          "${picked.month.toString().padLeft(2, '0')}-"
          "${picked.day.toString().padLeft(2, '0')}";

      setState(() {});
    }
  }

  final List<String> workAuthorizationOptions = [
    "Citizens Only",
    "Permanent Residents",
    "Work Visa Holders",
    "Any",
  ];

  final List<String> currencyOptions = ["INR", "USD", "EUR", "GBP", "AED"];

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    openingsController.dispose();
    eligibilityController.dispose();
    skillsController.dispose();
    certificationsController.dispose();
    benefitsController.dispose();
    fieldOfStudyController.dispose();
    currencyController.dispose();
    totalCTCController.dispose();
    fixedPayController.dispose();
    roundsController.dispose();
    selectionProcessController.dispose();
    endDateController.dispose();
    minExperienceController.dispose();
    joiningBonusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: referralPostViewModel,
      child: Scaffold(
        backgroundColor: AppColors.kBg,
        appBar: AppBar(
          backgroundColor: AppColors.kCard,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Post Referral",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              await saveDraft();

              if (mounted) {
                Navigator.pop(context);
              }
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              /// 🔥 PROGRESS BAR
              Padding(
                padding: const EdgeInsets.all(16),
                child: LinearProgressIndicator(
                  value: (currentStep + 1) / totalSteps,
                  backgroundColor: Colors.grey.shade800,
                  color: AppColors.kGreen,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              Expanded(
                child: Form(
                  key: _formKey,
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (i) {
                      setState(() {
                        currentStep = i;
                      });
                    },
                    children: [
                      /// STEP 1 — JOB INFO
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: _card(
                          title: "Job Info",
                          children: [
                            MultiSelectDropdownChips(
                              key: const ValueKey('jobTitle'),
                              label: "Job Title",
                              controller: titleController,
                              options: jobTitleOptions,
                            ),
                            SizedBox(height: 10),
                            _fieldDark(
                              "Description",
                              controller: descriptionController,
                              maxLines: 3,
                            ),

                            _fieldDark(
                              "Eligibility Criteria",
                              controller: eligibilityController,
                              maxLines: 3,
                            ),
                            //                     const SizedBox(height: 12),

                            // _fieldDark(
                            //   "Minimum Experience",
                            //   controller: minExperienceController,
                            //   keyboardType: TextInputType.number,
                            // ),
                          ],
                        ),
                      ),

                      /// STEP 2 — LOCATION
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: _card(
                          title: "Location & Work",
                          children: [
                            isLoadingStates
                                ? const CircularProgressIndicator()
                                : _dropdownDark(
                                    "State",
                                    selectedState.isEmpty
                                        ? null
                                        : selectedState,
                                    states,
                                    (val) {
                                      setState(() {
                                        selectedState = val!;
                                      });

                                      fetchCities(val!);
                                    },
                                  ),

                            if (selectedState.isNotEmpty)
                              isLoadingCities
                                  ? const CircularProgressIndicator()
                                  : _dropdownDark(
                                      "City",
                                      selectedCity.isEmpty
                                          ? null
                                          : selectedCity,
                                      cities,
                                      (val) =>
                                          setState(() => selectedCity = val!),
                                    ),
                            _dropdownDark(
                              "Broadcast Type",
                              broadcastType,
                              ["Everyone", "Location"],
                              (val) => setState(() => broadcastType = val!),
                            ),
                            _dropdownDark(
                              "Employment Type",
                              employmentType,
                              ["Full-time", "Part-time", "Contract"],
                              (val) => setState(() => employmentType = val!),
                            ),

                            _dropdownDark(
                              "Work Mode",
                              workMode,
                              ["On-site", "Remote", "Hybrid"],
                              (val) => setState(() => workMode = val!),
                            ),
                          ],
                        ),
                      ),

                      /// STEP 3 — EDUCATION
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: _card(
                          title: "Education & Experience",
                          children: [
                            _dropdownDark(
                              "Minimum Education",
                              minEducation,
                              educationOptions,
                              (val) => setState(() {
                                minEducation = val!;
                                fieldOfStudyController.clear();
                              }),
                            ),

                            SearchableChipField(
                              label: "Stream",
                              controller: fieldOfStudyController,
                              options: fieldOfStudyOptions,
                            ),

                            // _fieldDark(
                            //   "Minimum Experience",
                            //   controller:
                            //       minExperienceController,
                            //   keyboardType:
                            //       TextInputType.number,
                            // ),

                            // MultiSelectDropdownChips(
                            //   key: ValueKey(
                            //     'fieldOfStudy_$minEducation',
                            //   ),
                            //   label: "Preferred Field of Study",
                            //   controller: fieldOfStudyController,
                            //   options: fieldOfStudyOptions,
                            // ),
                            const SizedBox(height: 14),

                            _dropdownDark(
                              "Experience Range",
                              experienceRange,
                              experienceOptions,
                              (val) => setState(() => experienceRange = val!),
                            ),

                            _fieldDark(
                              "No. of Openings",
                              controller: openingsController,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),

                      /// STEP 4 — HIRING PROCESS
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(16),

                        child: _card(
                          title: "Hiring Process",

                          children: [
                            _ChipMultiSelectField(
                              label: "Rounds",
                              controller: roundsController,
                              options: roundsOptions,
                              singleSelect: true,

                              onChanged: () {
                                final match = RegExp(
                                  r'\d+',
                                ).firstMatch(roundsController.text);

                                final maxRounds =
                                    int.tryParse(match?.group(0) ?? '') ?? 0;

                                final currentProcesses =
                                    selectionProcessController.text
                                        .split(',')
                                        .map((e) => e.trim())
                                        .where((e) => e.isNotEmpty)
                                        .toList();

                                /// REMOVE EXTRA ITEMS
                                if (currentProcesses.length > maxRounds) {
                                  final trimmed = currentProcesses
                                      .take(maxRounds)
                                      .toList();

                                  selectionProcessController.text = trimmed
                                      .join(', ');

                                  setState(() {});
                                }
                              },
                            ),

                            const SizedBox(height: 16),

                            _chipMultiSelectField(
                              "Selection Process",
                              selectionProcessController,
                              selectionProcessOptions,
                            ),

                            const SizedBox(height: 16),

                            GestureDetector(
                              onTap: pickEndDate,

                              child: AbsorbPointer(
                                child: _fieldDark(
                                  "Application Deadline",
                                  controller: endDateController,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// STEP 4 — PACKAGE
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: _card(
                          title: "Package Details",
                          children: [
                            _dropdownDark(
                              "Currency",
                              currencyController.text,
                              currencyOptions,
                              (val) => setState(
                                () => currencyController.text = val!,
                              ),
                            ),

                            _fieldDark(
                              "Total CTC",
                              controller: totalCTCController,
                              keyboardType: TextInputType.number,
                            ),

                            _fieldDark(
                              "Fixed Pay",
                              controller: fixedPayController,
                              keyboardType: TextInputType.number,
                            ),

                            _fieldDark(
                              "Variable Pay",
                              controller: joiningBonusController,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),

                      /// STEP 9 — BENEFITS & STUDIES
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(16),

                        child: _card(
                          title: "Benefits & Studies",

                          children: [
                            // SearchableChipField(
                            //   label:
                            //       "Preferred Field of Study",

                            //   controller:
                            //       fieldOfStudyController,

                            //   options:
                            //       fieldOfStudyOptions,
                            // ),

                            // const SizedBox(height: 16),
                            SearchableChipField(
                              label: "Benefits",

                              controller: benefitsController,

                              options: benefitOptions,
                            ),

                            const SizedBox(height: 16),

                            _dropdownDark(
                              "Work Authorization",

                              workAuthorization,

                              workAuthorizationOptions,

                              (val) => setState(() => workAuthorization = val!),
                            ),
                          ],
                        ),
                      ),

                      /// STEP 5 — TAGS
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: _card(
                          title: "Tags",
                          children: [_tagsEnumField()],
                        ),
                      ),

                      /// STEP 6 — SKILLS
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(16),

                        child: _card(
                          title: "Skills",

                          children: [
                            _ChipMultiSelectField(
                              label: "Skills",
                              controller: skillsController,
                              options: skillOptionsApi,
                            ),
                          ],
                        ),
                      ),

                      /// STEP 7 — CERTIFICATIONS
                      /// STEP 7 — CERTIFICATIONS
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(16),

                        child: _card(
                          title: "Certifications",

                          children: [
                            SearchableChipField(
                              label: "Certifications",
                              controller: certificationsController,

                              options: certificationOptions,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// STEP 6 — SKILLS

              /// 🔥 BOTTOM BUTTONS
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.kGreen),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: previousStep,
                          child: const Text(
                            "Back",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.kGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: currentStep == totalSteps - 1
                              ? () async {
                                  final model = ReferralPostModel(
                                    jobTitle: _splitController(titleController),
                                    inactive: false,
                                    description: descriptionController.text
                                        .trim(),
                                    workMode: workMode != null
                                        ? [workMode!]
                                        : [],
                                    employmentType: employmentType != null
                                        ? [employmentType!]
                                        : [],
                                    broadcastType: broadcastType,
                                    jobType: "Referral",
                                    location: [selectedCity],
                                    minEducation: minEducation,
                                    numberOfOpenings:
                                        int.tryParse(openingsController.text) ??
                                        0,

                                    packageDetails: PackageDetails(
                                      currency: currencyController.text.trim(),
                                      totalCTC:
                                          int.tryParse(
                                            totalCTCController.text,
                                          ) ??
                                          0,
                                      fixedPay:
                                          int.tryParse(
                                            fixedPayController.text,
                                          ) ??
                                          0,
                                      joiningBonus:
                                          int.tryParse(
                                            joiningBonusController.text,
                                          ) ??
                                          0,
                                    ),
                                    skills: _splitController(skillsController),
                                    rounds: _splitController(roundsController),

                                    selectionProcess: _splitController(
                                      selectionProcessController,
                                    ),

                                    endDate: endDateController.text,

                                    minYearofExperience:
                                        minExperienceController.text,
                                    studentStreams: _splitController(
                                      fieldOfStudyController,
                                    ),
                                    tags: selectedTags.toList(),
                                    workAuthorization: workAuthorization,
                                    yearsOfExperience: experienceRange,
                                    benefits: _splitController(
                                      benefitsController,
                                    ),
                                    certifications: _splitController(
                                      certificationsController,
                                    ),
                                    eligibilityCriteria: eligibilityController
                                        .text
                                        .trim(),
                                    approvalStatus: 'Pending',
                                  );

                                  final success = await referralPostViewModel
                                      .postJob(model);

                                  if (success && mounted) {
                                    final prefs =
                                        await SharedPreferences.getInstance();

                                    await prefs.remove(draftKey);

                                    if (!mounted) return;
                                    await showDialog(
                                      context: context,
                                      barrierDismissible: false,

                                      // Very light overlay instead of heavy dark background
                                      barrierColor: Colors.black.withOpacity(
                                        0.12,
                                      ),

                                      builder: (_) {
                                        return Dialog(
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          insetPadding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 24,
                                              ),

                                          child: Container(
                                            padding: const EdgeInsets.all(24),

                                            decoration: BoxDecoration(
                                              color: AppColors.kCard,
                                              borderRadius:
                                                  BorderRadius.circular(24),

                                              border: Border.all(
                                                color: AppColors.kGreen
                                                    .withOpacity(.25),
                                              ),

                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(.15),
                                                  blurRadius: 25,
                                                  offset: const Offset(0, 8),
                                                ),
                                              ],
                                            ),

                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,

                                              children: [
                                                Container(
                                                  height: 72,
                                                  width: 72,

                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.kGreen
                                                        .withOpacity(.12),
                                                  ),

                                                  child: Icon(
                                                    Icons.check_circle,
                                                    color: AppColors.kGreen,
                                                    size: 52,
                                                  ),
                                                ),

                                                const SizedBox(height: 18),

                                                const Text(
                                                  "Referral Added Successfully",
                                                  textAlign: TextAlign.center,

                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),

                                                const SizedBox(height: 10),

                                                const Text(
                                                  "Please wait for admin approval of your posted job.",
                                                  textAlign: TextAlign.center,

                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                  ),
                                                ),

                                                const SizedBox(height: 22),

                                                SizedBox(
                                                  width: double.infinity,

                                                  child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          AppColors.kGreen,

                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            vertical: 14,
                                                          ),

                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              14,
                                                            ),
                                                      ),
                                                    ),

                                                    onPressed: () {
                                                      Navigator.of(
                                                        context,
                                                      ).pop(); // close dialog
                                                      Navigator.of(
                                                        context,
                                                      ).pop(); // close page
                                                    },

                                                    child: const Text(
                                                      "Done",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                }
                              : nextStep,
                          child: Text(
                            currentStep == totalSteps - 1
                                ? "Post Job"
                                : "Continue",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Tags widget — enum chips only, no free text ───────────────────────────

  Widget _tagsEnumField() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: tagOptions.map((tag) {
          final isSelected = selectedTags.contains(tag);
          return FilterChip(
            label: Text(tag),
            selected: isSelected,
            onSelected: (_) {
              setState(() {
                if (isSelected) {
                  selectedTags.remove(tag);
                } else {
                  selectedTags.add(tag);
                }
              });
            },
            backgroundColor: AppColors.kTile,
            selectedColor: AppColors.kGreen,
            checkmarkColor: AppColors.white,
            labelStyle: TextStyle(
              color: isSelected ? AppColors.white : null,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          );
        }).toList(),
      ),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  List<String> _splitController(TextEditingController c) {
    return c.text
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _fieldDark(
    String label, {
    required TextEditingController controller,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,

        /// 🔥 IMPORTANT CHANGES
        maxLines: maxLines,
        minLines: maxLines > 1 ? 3 : 1,
        keyboardType: maxLines > 1 ? TextInputType.multiline : keyboardType,
        textInputAction: maxLines > 1
            ? TextInputAction.newline
            : TextInputAction.done,

        style: const TextStyle(color: Colors.white),

        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: AppColors.kCard,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _dropdownDark(
    String label,
    String? value,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        value: value,
        dropdownColor: AppColors.kCard,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: AppColors.kCard,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e, style: const TextStyle(color: Colors.white)),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _card({required String title, required List<Widget> children}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kTile,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.s16W600.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class MultiSelectDropdownChips extends StatefulWidget {
  const MultiSelectDropdownChips({
    super.key,
    required this.label,
    required this.options,
    required this.controller,
  });

  final String label;
  final List<String> options;
  final TextEditingController controller;

  @override
  State<MultiSelectDropdownChips> createState() =>
      _MultiSelectDropdownChipsState();
}

class _MultiSelectDropdownChipsState extends State<MultiSelectDropdownChips> {
  List<String> selected = [];
  final TextEditingController customController = TextEditingController();

  @override
  void initState() {
    super.initState();

    selected = widget.controller.text.isEmpty
        ? []
        : widget.controller.text.split(',').map((e) => e.trim()).toList();
  }

  void _updateController() {
    widget.controller.text = selected.join(', ');
  }

  void _toggleItem(String item) {
    setState(() {
      if (selected.contains(item)) {
        selected.remove(item);
      } else {
        selected.add(item);
      }
      _updateController();
    });
  }

  void _addCustom() {
    final val = customController.text.trim();
    if (val.isEmpty) return;

    setState(() {
      selected.add(val);
      _updateController();
    });

    customController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: const TextStyle(color: Colors.white)),

        const SizedBox(height: 8),

        /// 🔥 Chips moved ABOVE
        if (selected.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: selected.map((item) {
              return Chip(
                label: Text(item),
                onDeleted: () {
                  setState(() {
                    selected.remove(item);
                    _updateController();
                  });
                },
              );
            }).toList(),
          ),

        if (selected.isNotEmpty) const SizedBox(height: 10),

        /// 🔥 Dropdown-like UI
        PopupMenuButton(
          color: AppColors.kCard,
          offset: const Offset(0, 45),

          itemBuilder: (context) {
            return [
              PopupMenuItem(
                enabled: false,
                child: StatefulBuilder(
                  builder: (context, setStatePopup) {
                    return SizedBox(
                      height: widget.options.length > 6 ? 300 : null,
                      width: 300,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...widget.options.map((item) {
                              final isSelected = selected.contains(item);

                              return ListTile(
                                dense: true,
                                title: Text(
                                  item,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                onTap: () {
                                  setStatePopup(() {
                                    _toggleItem(item);
                                  });
                                },
                              );
                            }),

                            /// 🔥 Others input
                            if (selected.contains("Others")) ...[
                              TextField(
                                controller: customController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: "Add custom",
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                onSubmitted: (_) {
                                  _addCustom();
                                  setStatePopup(() {});
                                },
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ];
          },

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.kCard,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selected.isEmpty
                      ? "Select options"
                      : "${selected.length} selected",
                  style: const TextStyle(color: Colors.grey),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SearchableChipField extends StatefulWidget {
  const SearchableChipField({
    super.key,
    required this.label,
    required this.options,
    required this.controller,
    this.onChanged,
  });

  final String label;
  final List<String> options;
  final TextEditingController controller;
  final Function(String value)? onChanged;
  @override
  State<SearchableChipField> createState() => _SearchableChipFieldState();
}

class _SearchableChipFieldState extends State<SearchableChipField> {
  final TextEditingController searchController = TextEditingController();

  List<String> selected = [];

  @override
  void initState() {
    super.initState();

    selected = widget.controller.text.isEmpty
        ? []
        : widget.controller.text.split(',').map((e) => e.trim()).toList();
  }

  void _updateController() {
    widget.controller.text = selected.join(', ');

    widget.onChanged?.call(widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final query = searchController.text.trim().toLowerCase();

    final suggestions = widget.options.where((e) {
      final alreadySelected = selected.any(
        (s) => s.toLowerCase() == e.toLowerCase(),
      );

      return e.toLowerCase().contains(query) && !alreadySelected;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          widget.label,

          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 12),

        /// SELECTED CHIPS
        if (selected.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 8,

            children: selected.map((item) {
              return Chip(
                label: Text(item),

                onDeleted: () {
                  setState(() {
                    selected.remove(item);
                    _updateController();
                  });
                },
              );
            }).toList(),
          ),

        if (selected.isNotEmpty) const SizedBox(height: 12),

        /// SEARCH FIELD
        TextField(
          controller: searchController,

          style: const TextStyle(color: Colors.white),

          decoration: InputDecoration(
            hintText: "Search or add",

            hintStyle: const TextStyle(color: Colors.grey),

            filled: true,

            fillColor: AppColors.kCard,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),

              borderSide: BorderSide.none,
            ),
          ),

          onChanged: (_) {
            setState(() {});
          },
        ),

        const SizedBox(height: 12),

        /// CREATE OPTION
        if (searchController.text.trim().isNotEmpty &&
            suggestions.isEmpty &&
            !widget.options.any(
              (e) =>
                  e.toLowerCase().trim() ==
                  searchController.text.toLowerCase().trim(),
            ))
          Container(
            margin: const EdgeInsets.only(top: 8),

            decoration: BoxDecoration(
              color: AppColors.kCard,
              borderRadius: BorderRadius.circular(12),
            ),

            child: ListTile(
              leading: const Icon(Icons.add, color: Color(0xFF22C55E)),

              title: Text(
                'Create "${searchController.text.trim()}"',

                style: const TextStyle(color: Colors.white),
              ),

              onTap: () async {
                final value = searchController.text.trim();

                setState(() {
                  selected.add(value);
                  _updateController();
                });

                final parentState = context
                    .findAncestorStateOfType<_ReferralPostViewState>();

                if (widget.label == 'Skills') {
                  await parentState?.addSkillIfNeeded(value);
                }

                searchController.clear();

                setState(() {});
              },
            ),
          ),

        /// SUGGESTIONS
        if (suggestions.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 8,

            children: suggestions.take(12).map((item) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selected.add(item);
                    _updateController();
                    searchController.clear();
                  });
                },

                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color: AppColors.kCard,

                    borderRadius: BorderRadius.circular(30),

                    border: Border.all(color: Colors.white.withOpacity(.08)),
                  ),

                  child: Text(
                    item,

                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}

class _ChipMultiSelectField extends StatefulWidget {
  const _ChipMultiSelectField({
    required this.label,
    this.singleSelect = false,
    required this.controller,
    required this.options,
    this.onChanged,
    super.key,
  });

  final String label;
  final TextEditingController controller;
  final List<String> options;
  final VoidCallback? onChanged;
  final bool singleSelect;
  @override
  State<_ChipMultiSelectField> createState() => _ChipMultiSelectFieldState();
}

class _ChipMultiSelectFieldState extends State<_ChipMultiSelectField> {
  final TextEditingController _textController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  bool _showFreeText = false;

  List<String> get _selectedItems {
    if (widget.controller.text.isEmpty) {
      return [];
    }

    return widget.controller.text
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  void _sync(List<String> items) {
    widget.controller.text = items.join(', ');

    widget.onChanged?.call();
  }

  void _addItem(String value) {
    final trimmed = value.trim();

    if (trimmed.isEmpty) {
      return;
    }

    final current = _selectedItems;

    /// 🔥 LIMIT SELECTION PROCESS COUNT
    if (widget.label == 'Selection Process') {
      final parentState = context
          .findAncestorStateOfType<_ReferralPostViewState>();

      final maxAllowed = parentState?.maxSelectionProcessCount ?? 999;

      if (current.length >= maxAllowed) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Only $maxAllowed selection process steps allowed'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.orange,
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            duration: const Duration(seconds: 2),
          ),
        );

        return;
      }
    }

    /// 🔥 normalize
    final normalizedInput = trimmed.toLowerCase().replaceAll(' ', '');

    /// 🔥 find matching option from API
    String? matchedOption;

    for (final option in widget.options) {
      final normalizedOption = option.toLowerCase().replaceAll(' ', '');

      if (normalizedOption == normalizedInput) {
        matchedOption = option;
        break;
      }
    }

    /// 🔥 use API option if exists
    final finalValue = matchedOption ?? trimmed;

    /// 🔥 avoid duplicate after normalization
    final alreadyExists = current.any(
      (e) =>
          e.toLowerCase().replaceAll(' ', '') ==
          finalValue.toLowerCase().replaceAll(' ', ''),
    );

    if (!alreadyExists) {
      if (widget.singleSelect) {
        current.clear();
      }

      current.add(finalValue);

      _sync(current);
    }

    _textController.clear();

    _focusNode.requestFocus();

    setState(() {});
  }

  void _removeItem(String value) {
    final current = _selectedItems..remove(value);

    _sync(current);

    if (value == 'Others') {
      setState(() {
        _showFreeText = false;
      });
    }

    setState(() {});
  }

  void _toggleEnumChip(String value) {
    final current = _selectedItems;

    if (current.contains(value)) {
      current.remove(value);

      _sync(current);

      if (value == 'Others') {
        _showFreeText = false;
      }
    } else {
      current.add(value);

      _sync(current);

      if (value == 'Others') {
        _showFreeText = true;
      }
    }

    setState(() {});
  }

  @override
  void dispose() {
    _textController.dispose();

    _focusNode.dispose();

    super.dispose();
  }

  List<String> get _filteredSuggestions {
    final query = _textController.text.trim().toLowerCase();

    if (query.isEmpty) {
      return [];
    }

    final selectedNormalized = _selectedItems
        .map((e) => e.toLowerCase().replaceAll(' ', ''))
        .toSet();

    return widget.options
        .where((option) {
          final normalized = option.toLowerCase().replaceAll(' ', '');

          return option.toLowerCase().contains(query) &&
              !selectedNormalized.contains(normalized);
        })
        .take(8)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final selected = _selectedItems;

    final hasEnums = widget.options.isNotEmpty;

    final isSimpleSelection = widget.label == 'Employment Type';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        /// SEARCH FIELD
        if (!isSimpleSelection) ...[
          Column(
            children: [
              TextField(
                controller: _textController,

                focusNode: _focusNode,

                style: const TextStyle(color: Colors.white),

                onChanged: (_) {
                  setState(() {});
                },

                decoration: InputDecoration(
                  hintText: "Search or add ${widget.label}",

                  hintStyle: const TextStyle(color: Colors.grey),

                  filled: true,

                  fillColor: AppColors.kCard,

                  prefixIcon: const Icon(Icons.search, color: Colors.grey),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),

                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              if (_textController.text.trim().isNotEmpty &&
                  _filteredSuggestions.isEmpty &&
                  !widget.options.any(
                    (e) =>
                        e.toLowerCase().trim() ==
                        _textController.text.toLowerCase().trim(),
                  ))
                Container(
                  margin: const EdgeInsets.only(top: 8),

                  decoration: BoxDecoration(
                    color: AppColors.kCard,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: ListTile(
                    leading: const Icon(Icons.add, color: Color(0xFF22C55E)),

                    title: Text(
                      'Create "${_textController.text.trim()}"',

                      style: const TextStyle(color: Colors.white),
                    ),

                    onTap: () async {
                      final value = _textController.text.trim();

                      _addItem(value);

                      final parentState = context
                          .findAncestorStateOfType<_ReferralPostViewState>();

                      if (widget.label == 'Skills') {
                        await parentState?.addSkillIfNeeded(value);
                      }

                      _textController.clear();

                      setState(() {});
                    },
                  ),
                ),
            ],
          ),

          const SizedBox(height: 16),
        ],

        /// SELECTED ITEMS
        if (selected.isNotEmpty) ...[
          Wrap(
            spacing: 8,
            runSpacing: 8,

            children: selected.map((item) {
              return Chip(
                label: Text(item),

                backgroundColor: const Color(0xFF22C55E),

                labelStyle: const TextStyle(color: Colors.black),

                deleteIcon: const Icon(Icons.close, size: 18),

                onDeleted: () => _removeItem(item),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),
        ],

        /// POPULAR TITLE
        Text(
          "POPULAR ${widget.label.toUpperCase()}",

          style: const TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 10),

        /// OPTIONS
        if (hasEnums)
          Wrap(
            spacing: 8,
            runSpacing: 8,

            children: widget.options.map((option) {
              final isSelected = selected.contains(option);

              return GestureDetector(
                onTap: () {
                  if (isSelected) {
                    _removeItem(option);
                  } else {
                    _addItem(option);
                  }
                },

                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF22C55E)
                        : AppColors.kCard,

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Text(
                    option,

                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
