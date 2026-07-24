import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/profile/presentation/widgets/auto_complete_field.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart';

class AddEditProfileView extends StatefulWidget {
  const AddEditProfileView({
    this.user,
    this.initialStep,
    this.isSwitchingToProfessional = false,
    super.key,
  });
  final int? initialStep;
  final User? user;
  final bool isSwitchingToProfessional;
  @override
  State<AddEditProfileView> createState() => _AddEditProfileViewState();
}

class _AddEditProfileViewState extends State<AddEditProfileView> {
  final AddEditProfileViewModel addEditProfileViewModel =
      AddEditProfileViewModel();
  late UserController controller = addEditProfileViewModel.userController;
  final _formKey = GlobalKey<FormState>();
  bool _isParsingResume = false;
  File? _pickedResumeFile;

  bool isExperienceExpanded = false;
  Map<String, String> currencySymbols = {
    "INR": "₹",
    "USD": "\$",
    "EUR": "€",
    "GBP": "£",
  };
  // ── Enum lists ──────────────────────────────────────────────────────────────
  bool hasChanges = false;
  void markChanged() {
    if (!hasChanges) {
      setState(() {
        hasChanges = true;
      });
    }
  }

  final countryOptions = const [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Argentina",
    "Australia",
    "Austria",
    "Bangladesh",
    "Belgium",
    "Brazil",
    "Canada",
    "China",
    "Denmark",
    "Egypt",
    "Finland",
    "France",
    "Germany",
    "Hong Kong",
    "India",
    "Indonesia",
    "Ireland",
    "Italy",
    "Japan",
    "Malaysia",
    "Mexico",
    "Nepal",
    "Netherlands",
    "New Zealand",
    "Norway",
    "Pakistan",
    "Philippines",
    "Qatar",
    "Saudi Arabia",
    "Singapore",
    "South Africa",
    "South Korea",
    "Spain",
    "Sri Lanka",
    "Sweden",
    "Switzerland",
    "Thailand",
    "Turkey",
    "UAE",
    "United Kingdom",
    "United States",
    "Vietnam",
  ];
  List<Map<String, dynamic>> colleges = [];

  List<Map<String, dynamic>> degrees = [];

  List<Map<String, dynamic>> streams = [];

  List<String> companyOptions = [];

  List<String> skillOptionsApi = [];

  String? selectedDegreeId;
  Future<void> fetchColleges() async {
    final response = await getIt<NetworkService>().request(
      Request(
        method: RequestMethod.get,

        endpoint: "api/colleges/all",

        isSafeRoute: true,
      ),
    );

    colleges = List<Map<String, dynamic>>.from(response.data);

    setState(() {});
  }

  Future<void> fetchDegrees() async {
    final response = await getIt<NetworkService>().request(
      Request(
        method: RequestMethod.get,

        endpoint: "api/master-data?type=DEGREE",

        isSafeRoute: true,
      ),
    );

    degrees = List<Map<String, dynamic>>.from(response.data['data']);

    setState(() {});
  }

  Future<void> fetchStreams(String degreeId) async {
    selectedDegreeId = degreeId;

    final response = await getIt<NetworkService>().request(
      Request(
        method: RequestMethod.get,

        endpoint: "api/master-data?type=STREAM&parent=$degreeId",

        isSafeRoute: true,
      ),
    );

    streams = List<Map<String, dynamic>>.from(response.data['data']);

    setState(() {});
  }

  Future<void> fetchCompanies() async {
    final response = await getIt<NetworkService>().request(
      Request(
        method: RequestMethod.get,
        endpoint: "api/company",
        isSafeRoute: true,
      ),
    );

    final data = List<Map<String, dynamic>>.from(response.data['data'] ?? []);

    companyOptions = data.map((e) => e['name'].toString()).toList();

    setState(() {});
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

  Future<void> addCollegeIfNeeded(String value) async {
    final exists = colleges.any(
      (e) =>
          e['label'].toString().toLowerCase().trim() ==
          value.toLowerCase().trim(),
    );

    if (exists) return;

    await getIt<NetworkService>().request(
      Request(
        method: RequestMethod.post,

        endpoint: "/api/colleges/register",

        isSafeRoute: true,

        body: {"name": value},
      ),
    );

    await fetchColleges();
  }

  Future<void> addDegreeIfNeeded(String value) async {
    final exists = degrees.any(
      (e) =>
          e['value'].toString().toLowerCase().trim() ==
          value.toLowerCase().trim(),
    );

    if (exists) return;

    await getIt<NetworkService>().request(
      Request(
        method: RequestMethod.post,

        endpoint: "/api/master-data",

        isSafeRoute: true,

        body: {"type": "DEGREE", "value": value},
      ),
    );

    await fetchDegrees();
  }

  Future<void> addStreamIfNeeded(String value) async {
    if (selectedDegreeId == null) {
      return;
    }

    final exists = streams.any(
      (e) =>
          e['value'].toString().toLowerCase().trim() ==
          value.toLowerCase().trim(),
    );

    if (exists) return;

    await getIt<NetworkService>().request(
      Request(
        method: RequestMethod.post,

        endpoint: "/api/master-data",

        isSafeRoute: true,

        body: {"type": "STREAM", "value": value, "parent": selectedDegreeId},
      ),
    );

    await fetchStreams(selectedDegreeId!);
  }

  Future<void> addJobRoleIfNeeded(String value) async {
    final exists = jobRoleOptions.any(
      (e) => e.toLowerCase().trim() == value.toLowerCase().trim(),
    );

    if (exists) return;

    await getIt<NetworkService>().request(
      Request(
        method: RequestMethod.post,
        endpoint: "/api/company-master-data",
        isSafeRoute: true,
        body: {"type": "JOB_ROLE", "value": value, "parent": null},
      ),
    );

    setState(() {
      jobRoleOptions.add(value);
    });
  }

  Future<void> addCompanyIfNeeded(String value) async {
    final exists = companyOptions.any(
      (e) => e.toLowerCase().trim() == value.toLowerCase().trim(),
    );

    if (exists) return;

    await getIt<NetworkService>().request(
      Request(
        method: RequestMethod.post,
        endpoint: "api/company",
        isSafeRoute: true,
        body: {"name": value},
      ),
    );

    await fetchCompanies();
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

  List<String> degreeOptions = [
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
  final professionalStatuses = [
    "open_to_work",
    "career_break",
    "freelancing",
    "building",
    "not_looking",
  ];

  final studentStatuses = [
    "looking_internship",
    "looking_job",
    "preparing_exams",
  ];

  final semesterOptions = List.generate(8, (i) => "Semester ${i + 1}");

  final graduationYears = List.generate(91, (i) => (1960 + i).toString());

  final industryOptions = [
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

  List<String> jobRoleOptions = [];
  Future<void> fetchJobRoles() async {
    final response = await getIt<NetworkService>().request(
      Request(
        method: RequestMethod.get,

        endpoint: "api/company-master-data?type=JOB_ROLE",

        isSafeRoute: true,
      ),
    );

    final data = List<Map<String, dynamic>>.from(response.data['data'] ?? []);

    jobRoleOptions =
        data
            .map((e) => e['value'].toString().trim())
            .where((e) => e.isNotEmpty)
            .toSet()
            .toList()
          ..sort();

    if (!jobRoleOptions.contains("Others")) {
      jobRoleOptions.add("Others");
    }

    setState(() {});
  }

  final employmentOptions = ["full time", "part time", "contract"];

  final lookingForOptions = ["Internship", "Job", "Both"];

  final genderOptions = ["Male", "Female", "Non-binary", "Prefer not to say"];

  final ethnicityOptions = [
    "Asian",
    "Black or African American",
    "Hispanic or Latino",
    "Native American or Alaska Native",
    "White",
    "Two or More Races",
    "Prefer not to say",
  ];
  String selectedState = "";

  List<String> states = [];
  List<String> cities = [];
  List<String> selectedCities = [];

  bool isLoadingStates = false;
  bool isLoadingCities = false;
  Future<void> fetchStates() async {
    try {
      setState(() => isLoadingStates = true);

      final res = await Dio().get(
        "https://countriesnow.space/api/v0.1/countries/states/q",
        queryParameters: {"country": "india"},
      );

      if (res.statusCode == 200 &&
          res.data["data"] != null &&
          res.data["data"]["states"] is List) {
        final List stateList = res.data["data"]["states"];

        setState(() {
          states = stateList.map<String>((e) => e["name"].toString()).toList();
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
        queryParameters: {"country": "india", "state": state.toLowerCase()},
      );

      if (res.statusCode == 200 && res.data["data"] is List) {
        setState(() {
          cities = List<String>.from(res.data["data"]);
        });
      }
    } finally {
      setState(() => isLoadingCities = false);
    }
  }

  final visaStatusOptions = [
    "Citizen",
    "Permanent Resident",
    "Work Visa (e.g., H1B)",
    "Student Visa (e.g., F1)",
    "Not Authorized to Work",
    "Other",
  ];

  final toolsOptions = [
    "VS Code",
    "Android Studio",
    "Xcode",
    "Postman",
    "Docker",
    "Kubernetes",
    "GitHub",
    "GitLab",
    "JIRA",
    "Slack",
    "Figma",
    "Adobe XD",
    "Jenkins",
    "Firebase",
    "AWS Console",
    "Google Cloud Platform",
    "Others",
  ];

  final languageOptions = [
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

  final domainKnowledgeOptions = [
    "Web Development",
    "Mobile Development",
    "Machine Learning",
    "Deep Learning",
    "Data Engineering",
    "Cloud Computing",
    "Blockchain",
    "IoT",
    "Cybersecurity",
    "AR/VR",
    "Game Development",
    "Embedded Systems",
    "Others",
  ];

  final skillOptions = [
    "Flutter",
    "Dart",
    "React",
    "React Native",
    "Angular",
    "Vue.js",
    "Node.js",
    "Python",
    "Java",
    "Kotlin",
    "Swift",
    "JavaScript",
    "TypeScript",
    "C++",
    "C#",
    "Go",
    "Rust",
    "PHP",
    "Ruby",
    "SQL",
    "MongoDB",
    "Firebase",
    "GraphQL",
    "REST APIs",
    "Docker",
    "Kubernetes",
    "AWS",
    "Azure",
    "Git",
    "Linux",
    "Others",
  ];

  final shiftOptions = ["Day", "Night", "Rotational", "Any"];

  final maritalStatusOptions = [
    "Single",
    "Married",
    "Divorced",
    "Widowed",
    "Prefer not to say",
  ];
  final PageController _pageController = PageController();

  int currentStep = 0;

  final int totalSteps = 16;

  void nextStep() {
    if (currentStep < totalSteps - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  // ── State ────────────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    currentStep = widget.initialStep ?? 0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(currentStep);
    });
    fetchColleges();
    fetchStates();
    fetchDegrees();

    fetchCompanies();

    fetchSkills();
    fetchJobRoles();
    addEditProfileViewModel.setUserController(widget.user);
    selectedCities = controller.locations
        .map((e) => e.text)
        .where((e) => e.isNotEmpty)
        .toList();
    // if (controller.experiences.isEmpty) {
    //   controller.experiences.add(ExperienceController());
    // }

    if (controller.skills.isEmpty) {
      controller.skills.add(TextEditingController());
    }
  }

  final isProfessional =
      getIt<AppStateProvider>().userType == UserType.professional;

  final isFresher = getIt<AppStateProvider>().userType == UserType.fresher;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // ── Build ────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: addEditProfileViewModel,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.kBg,
            appBar: AppBar(
              backgroundColor: AppColors.kBg,
              elevation: 0,

              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => context.pop(), // 🔥 simple back
              ),
            ),
            // appBar: RAppBar(
            //   leading: widget.user != null
            //       ? IconButton(
            //           onPressed: () => context.pop(),
            //           icon: Icon(
            //             Icons.keyboard_arrow_left,
            //             color: AppColors.white,
            //           ),
            //         )
            //       : null,
            //   title: Text(
            //     widget.user != null ? 'Edit Profile' : 'Complete your profile',
            //     style: AppTextStyles.s16W600.copyWith(color: AppColors.white),
            //   ),
            // ),
            body: SafeArea(
              child: Column(
                children: [
                  /// 🔥 PROGRESS BAR
                  Padding(
                    padding: const EdgeInsets.all(16),
                    // child: LinearProgressIndicator(
                    //   value: (currentStep + 1) / totalSteps,
                    //   backgroundColor: Colors.grey.shade800,
                    //   color: AppColors.kGreen,
                    //   minHeight: 8,
                    //   borderRadius: BorderRadius.circular(20),
                    // ),
                  ),

                  /// 🔥 STEPS
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
                          /// ───────────────── BASIC ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: Column(
                              children: [
                                AppButton(
                                  backgroundColor: AppColors.kGreen,

                                  onPressed: parseResumeAndFill,

                                  child: const Text('Upload Resume & Autofill'),
                                ),

                                const SizedBox(height: 20),

                                ProfileSection(
                                  label: 'Basic',

                                  spacing: 16,

                                  children: [
                                    ProfileImage(
                                      imagePath:
                                          widget.user?.profileImage ?? '',

                                      onImageSelected: (image) {
                                        addEditProfileViewModel.pickedImage =
                                            image;
                                      },
                                    ),

                                    AppTextFields(
                                      controller: controller.name,

                                      hint: 'Name',

                                      onChanged: (_) => markChanged(),
                                    ),

                                    AppTextFields(
                                      controller: controller.email,

                                      hint: 'Email',

                                      onChanged: (_) => markChanged(),
                                    ),

                                    AppTextFields(
                                      controller: controller.phone,

                                      hint: 'Phone',

                                      onChanged: (_) => markChanged(),
                                      keyboardType: TextInputType.number,
                                    ),

                                    _dropdownField(
                                      controller.gender,
                                      'Gender',
                                      genderOptions,
                                    ),

                                    _datePickerField(
                                      controller.dob,
                                      'Date of Birth',
                                    ),

                                    _dropdownField(
                                      controller.ethnicity,
                                      'Ethnicity',
                                      ethnicityOptions,
                                    ),

                                    _dropdownField(
                                      controller.maritalStatus,
                                      'Marital Status',
                                      maritalStatusOptions,
                                    ),

                                    _dropdownField(
                                      controller.visaStatus,
                                      'Visa Status / Work Authorization',
                                      visaStatusOptions,
                                    ),
                                    AppTextFields(
                                      controller: controller.about,

                                      hint: 'About',

                                      maxLines: 4,

                                      onChanged: (_) => markChanged(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          /// ───────────────── CAREER ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: ProfileSection(
                              label: 'Career',

                              spacing: 16,

                              children: [
                                AppTextFields(
                                  controller: controller.currentCompany,

                                  hint: 'Current Company',

                                  enable: false,

                                  suffixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Colors.grey,
                                    size: 18,
                                  ),

                                  helperText:
                                      "Automatically fetched from current experience",

                                  onChanged: (_) => markChanged(),
                                ),
                                const SizedBox(height: 12),

                                AppTextFields(
                                  controller: controller.totalYearsOfExperience,

                                  hint: 'Total Years Of Experience',

                                  keyboardType: TextInputType.text,

                                  onChanged: (_) => markChanged(),
                                ),
                                const SizedBox(height: 12),

                                AppTextFields(
                                  controller: controller.noticePeriod,

                                  hint: 'Notice Period (days)',

                                  enable: false,

                                  suffixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Colors.grey,
                                    size: 18,
                                  ),

                                  helperText:
                                      "Automatically fetched from current experience",
                                ),
                                const SizedBox(height: 16),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                  ),

                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1F2937),
                                    borderRadius: BorderRadius.circular(12),
                                  ),

                                  child: Row(
                                    children: [
                                      const Expanded(
                                        child: Text(
                                          "Currently Serving Notice Period",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),

                                      Switch(
                                        value: controller.servingNoticePeriod,

                                        onChanged: (value) {
                                          setState(() {
                                            controller.servingNoticePeriod =
                                                value;
                                          });

                                          markChanged();
                                        },
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 16),
                                if (controller.servingNoticePeriod)
                                  GestureDetector(
                                    onTap: () async {
                                      final picked = await showDatePicker(
                                        context: context,

                                        initialDate: DateTime.now(),

                                        firstDate: DateTime(2000),

                                        lastDate: DateTime(2100),
                                      );

                                      if (picked != null) {
                                        controller.noticePeriodStartDate.text =
                                            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";

                                        setState(() {});

                                        markChanged();
                                      }
                                    },

                                    child: AbsorbPointer(
                                      child: AppTextFields(
                                        controller:
                                            controller.noticePeriodStartDate,

                                        hint: 'Notice Period Start Date',
                                      ),
                                    ),
                                  ),
                                Builder(
                                  builder: (_) {
                                    final notice = calculateNoticePeriodStatus(
                                      controller.noticePeriodStartDate.text,
                                      controller.noticePeriod.text,
                                    );

                                    if (notice == null ||
                                        controller.servingNoticePeriod !=
                                            true) {
                                      return const SizedBox();
                                    }

                                    return Container(
                                      margin: const EdgeInsets.only(top: 16),

                                      padding: const EdgeInsets.all(16),

                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1F2937),
                                        borderRadius: BorderRadius.circular(16),
                                      ),

                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  notice["isExpired"]
                                                      ? "Notice Period Complete"
                                                      : "In Notice Period",

                                                  style: TextStyle(
                                                    color: notice["isExpired"]
                                                        ? Colors.green
                                                        : Colors.orange,

                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          const SizedBox(height: 14),

                                          Text(
                                            "Start Date: ${controller.noticePeriodStartDate.text}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),

                                          const SizedBox(height: 8),

                                          Text(
                                            "Total Notice Period: ${controller.noticePeriod.text} days",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),

                                          const SizedBox(height: 8),

                                          Text(
                                            "Days Served: ${notice["daysPassed"]}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),

                                          const SizedBox(height: 8),

                                          Text(
                                            "Days Remaining: ${notice["daysRemaining"]}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),

                                          const SizedBox(height: 8),

                                          Text(
                                            "Expected Last Day: ${notice["endDate"]}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),

                                          const SizedBox(height: 14),

                                          LinearProgressIndicator(
                                            value: notice["progress"],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),

                                Row(
                                  children: [
                                    SizedBox(
                                      width: 80,

                                      child: _dropdownField(
                                        controller.currentSalaryCurrency,
                                        'Cur',
                                        ['\$', '₹', '€', '£'],
                                      ),
                                    ),
                                    const SizedBox(width: 12),

                                    Expanded(
                                      child: AppTextFields(
                                        controller:
                                            controller.currentSalaryAmount,

                                        hint: 'Current Salary',

                                        onChanged: (_) => markChanged(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          /// ───────────────── SKILLS ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: _chipMultiSelectField(
                              'Skills',
                              controller.skills.first,
                              skillOptionsApi,
                            ),
                          ),

                          /// ───────────────── EDUCATION ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: ProfileSection(
                              label: 'Education',

                              trailing: _addButton(() {
                                setState(() {
                                  controller.educations.add(
                                    EducationController(),
                                  );
                                });
                              }),

                              children: controller.educations
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                    final index = entry.key;

                                    final e = entry.value;

                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 16),

                                      padding: const EdgeInsets.all(16),

                                      decoration: BoxDecoration(
                                        color: const Color(0xFF111827),

                                        borderRadius: BorderRadius.circular(16),
                                      ),

                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,

                                            children: [
                                              Text(
                                                "Education ${index + 1}",

                                                style: const TextStyle(
                                                  color: Colors.white,

                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),

                                              if (controller.educations.length >
                                                  1)
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      controller.educations
                                                          .removeAt(index);
                                                    });
                                                  },

                                                  child: const Text(
                                                    "Remove",

                                                    style: TextStyle(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),

                                          const SizedBox(height: 16),

                                          /// COLLEGE
                                          CommonAutocomplete(
                                            label: "College",

                                            hint: "College",

                                            options: colleges
                                                .map(
                                                  (e) => e['label'].toString(),
                                                )
                                                .toList(),

                                            initialValue: e.college.text,

                                            showCreateOption: true,

                                            onChanged: (value) {
                                              e.college.text = value;

                                              markChanged();
                                            },

                                            onSelected: (value) async {
                                              await addCollegeIfNeeded(value);

                                              e.college.text = value;

                                              markChanged();
                                            },

                                            onCreate: (value) async {
                                              await addCollegeIfNeeded(value);

                                              e.college.text = value;

                                              markChanged();
                                            },
                                          ),

                                          const SizedBox(height: 16),

                                          /// DEGREE
                                          CommonAutocomplete(
                                            label: "Degree",

                                            hint: "Degree",

                                            options: degrees
                                                .map(
                                                  (e) => e['value'].toString(),
                                                )
                                                .toList(),

                                            initialValue: e.degree.text,

                                            showCreateOption: true,

                                            onChanged: (value) {
                                              e.degree.text = value;

                                              markChanged();
                                            },

                                            onSelected: (value) async {
                                              FocusScope.of(context).unfocus();

                                              await addDegreeIfNeeded(value);

                                              e.degree.text = value;

                                              final selected = degrees
                                                  .firstWhere(
                                                    (d) =>
                                                        d['value']
                                                            .toString()
                                                            .toLowerCase() ==
                                                        value.toLowerCase(),

                                                    orElse: () => {},
                                                  );

                                              if (selected.isNotEmpty) {
                                                e.selectedDegreeId =
                                                    selected['_id'];

                                                await fetchStreams(
                                                  e.selectedDegreeId!,
                                                );

                                                e.streams = streams;
                                              }

                                              setState(() {});
                                            },

                                            onCreate: (value) async {
                                              await addDegreeIfNeeded(value);

                                              e.degree.text = value;

                                              markChanged();
                                            },
                                          ),

                                          const SizedBox(height: 16),

                                          /// SPECIALIZATION
                                          CommonAutocomplete(
                                            label: "Specialization",

                                            hint: "Specialization",

                                            options: e.streams
                                                .map(
                                                  (s) => s['value'].toString(),
                                                )
                                                .toList(),

                                            initialValue: e.specialization.text,

                                            showCreateOption: true,

                                            onChanged: (value) {
                                              e.specialization.text = value;

                                              markChanged();
                                            },

                                            onSelected: (value) {
                                              FocusScope.of(context).unfocus();

                                              e.specialization.text = value;

                                              markChanged();
                                            },

                                            onCreate: (value) async {
                                              if (e.selectedDegreeId != null) {
                                                await addStreamIfNeeded(value);

                                                await fetchStreams(
                                                  e.selectedDegreeId!,
                                                );

                                                e.streams = streams;
                                              }

                                              e.specialization.text = value;

                                              markChanged();

                                              setState(() {});
                                            },
                                          ),

                                          const SizedBox(height: 16),

                                          AppTextFields(
                                            controller: e.cgpa,

                                            hint: 'CGPA',

                                            onChanged: (_) => markChanged(),
                                          ),

                                          const SizedBox(height: 16),

                                          _dropdownField(
                                            e.yearOfGraduation,

                                            'Graduation Year',

                                            graduationYears,
                                          ),

                                          if (!isProfessional &&
                                              !isFresher) ...[
                                            const SizedBox(height: 16),

                                            Row(
                                              children: [
                                                Expanded(
                                                  child: _dateField(
                                                    e.startDate,

                                                    "Start Date",
                                                  ),
                                                ),

                                                const SizedBox(width: 10),

                                                Expanded(
                                                  child: _dateField(
                                                    e.endDate,

                                                    "End Date",

                                                    enabled: !e.isCurrent,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16),

                                            Row(
                                              children: [
                                                Checkbox(
                                                  value: e.isCurrent,

                                                  onChanged: (val) {
                                                    setState(() {
                                                      e.isCurrent =
                                                          val ?? false;
                                                    });

                                                    markChanged();
                                                  },
                                                ),

                                                const Text(
                                                  "Currently Studying",

                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ],
                                      ),
                                    );
                                  })
                                  .toList(),
                            ),
                          ),

                          /// ───────────────── EXPERIENCE ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: ProfileSection(
                              key: ValueKey(
                                isExperienceExpanded,
                              ), // 🔥 IMPORTANT
                              label: 'Experience',
                              initiallyExpanded:
                                  isExperienceExpanded ||
                                  controller.experiences.any(
                                    (e) =>
                                        e.company.text.trim().isNotEmpty ||
                                        e.role.text.trim().isNotEmpty ||
                                        e.description.text.trim().isNotEmpty,
                                  ),
                              trailing: _addButton(() {
                                setState(() {
                                  controller.experiences.add(
                                    ExperienceController(),
                                  );
                                  isExperienceExpanded = true; // 🔥 OPEN IT
                                });
                              }),

                              children: [
                                if (!controller.experiences.any(
                                  (e) => e.isCurrent,
                                )) ...[
                                  _statusSection(),
                                  const SizedBox(height: 20),
                                ],

                                /// 🔥 COMMON EMAIL FIELD
                                ...controller.experiences.asMap().entries.map((
                                  entry,
                                ) {
                                  final index = entry.key;

                                  final e = entry.value;

                                  return _experienceCard(e, index);
                                }).toList(),
                              ],
                            ),
                          ),

                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: ProfileSection(
                              label: 'International Experience',

                              initiallyExpanded:
                                  controller.internationalExperiences.isEmpty ||
                                  controller.internationalExperiences.any(
                                    (e) =>
                                        e.country.text.trim().isNotEmpty ||
                                        e.organization.text.trim().isNotEmpty ||
                                        e.role.text.trim().isNotEmpty ||
                                        e.description.text.trim().isNotEmpty,
                                  ),

                              trailing: _addButton(() {
                                setState(() {
                                  controller.internationalExperiences.add(
                                    InternationalExperienceController(),
                                  );
                                });
                              }),

                              children: controller.internationalExperiences
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                    final index = entry.key;
                                    final e = entry.value;

                                    return _internationalCard(e, index);
                                  })
                                  .toList(),
                            ),
                          ),
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: ProfileSection(
                              label: 'Leadership Experience',

                              initiallyExpanded:
                                  controller.leadershipExperiences.isEmpty ||
                                  controller.leadershipExperiences.any(
                                    (e) =>
                                        e.organization.text.trim().isNotEmpty ||
                                        e.role.text.trim().isNotEmpty ||
                                        e.description.text.trim().isNotEmpty,
                                  ),

                              trailing: _addButton(() {
                                setState(() {
                                  controller.leadershipExperiences.add(
                                    LeadershipExperienceController(),
                                  );
                                });
                              }),

                              children: controller.leadershipExperiences
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                    final index = entry.key;
                                    final e = entry.value;

                                    return _leadershipCard(e, index);
                                  })
                                  .toList(),
                            ),
                          ),

                          /// ───────────────── EMPLOYEE PREFERENCES ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 80,

                                      child: _dropdownField(
                                        controller.expectedSalaryCurrency,
                                        'Cur',
                                        ['\$', '₹', '€', '£'],
                                      ),
                                    ),
                                    const SizedBox(width: 12),

                                    Expanded(
                                      child: AppTextFields(
                                        controller:
                                            controller.expectedSalaryAmount,

                                        hint: 'Expected Salary',

                                        onChanged: (_) => markChanged(),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                _dropdownField(
                                  controller.openToShift,
                                  'Open To Shift',
                                  shiftOptions,
                                ),

                                const SizedBox(height: 20),

                                _dropdownField(
                                  controller.employmentType.first,
                                  'Employment Type',
                                  ['full time', 'part time', 'contract'],
                                ),

                                const SizedBox(height: 20),

                                CommonAutocomplete(
                                  label: "Preferred Job Roles",

                                  hint: "Search Job Roles",

                                  options: jobRoleOptions,

                                  initialValue: controller.jobRoles.first.text,

                                  showCreateOption: true,

                                  onChanged: (value) {
                                    controller.jobRoles.first.text = value;

                                    markChanged();
                                  },

                                  onSelected: (value) async {
                                    FocusScope.of(context).unfocus();
                                    await addJobRoleIfNeeded(value);

                                    controller.jobRoles.first.text = value;

                                    markChanged();
                                  },

                                  onCreate: (value) async {
                                    await addJobRoleIfNeeded(value);

                                    controller.jobRoles.first.text = value;

                                    markChanged();

                                    setState(() {});
                                  },

                                  onSubmitted: (value) async {
                                    FocusScope.of(context).unfocus();
                                    await addJobRoleIfNeeded(value);

                                    controller.jobRoles.first.text = value;

                                    markChanged();
                                  },
                                ),

                                // const SizedBox(height: 20),

                                // ProfileSection(
                                //   label: 'Employment Type',

                                //   children: [
                                //     _chipMultiSelectField(
                                //       'Employment',
                                //       controller.employmentType.first,
                                //       employmentOptions,
                                //     ),
                                //   ],
                                // ),
                                const SizedBox(height: 20),

                                _dropdownField(
                                  controller.lookingFor.first,

                                  'Looking For',

                                  lookingForOptions,
                                ),

                                const SizedBox(height: 20),

                                isLoadingStates
                                    ? const CircularProgressIndicator()
                                    : AppDropdown(
                                        hint: "Select State",
                                        options: states,
                                        value: selectedState.isEmpty
                                            ? null
                                            : selectedState,
                                        onChanged: (val) {
                                          if (val == null) return;

                                          setState(() {
                                            selectedState = val;
                                            cities.clear();
                                          });

                                          fetchCities(val);
                                        },
                                      ),

                                const SizedBox(height: 12),

                                if (selectedState.isNotEmpty)
                                  isLoadingCities
                                      ? const CircularProgressIndicator()
                                      : AppDropdown(
                                          hint: "Select City",
                                          options: cities,
                                          value: null,
                                          onChanged: (val) {
                                            if (val == null) return;

                                            setState(() {
                                              if (!selectedCities.contains(
                                                val,
                                              )) {
                                                selectedCities.add(val);
                                              }
                                            });

                                            controller.locations.clear();

                                            for (final city in selectedCities) {
                                              controller.locations.add(
                                                TextEditingController(
                                                  text: city,
                                                ),
                                              );
                                            }

                                            markChanged();
                                          },
                                        ),

                                const SizedBox(height: 12),

                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: selectedCities.map((city) {
                                    return Chip(
                                      label: Text(city),
                                      onDeleted: () {
                                        setState(() {
                                          selectedCities.remove(city);
                                        });

                                        controller.locations.clear();

                                        for (final city in selectedCities) {
                                          controller.locations.add(
                                            TextEditingController(text: city),
                                          );
                                        }

                                        markChanged();
                                      },
                                    );
                                  }).toList(),
                                ),

                                const SizedBox(height: 20),

                                // _chipMultiSelectField(
                                //   'Job Roles',

                                //   controller.jobRoles.first,

                                //   jobRoleOptions,
                                // ),

                                // const SizedBox(height: 20),

                                // _chipMultiSelectField(
                                //   'Employment Type',

                                //   controller.employmentType.first,

                                //   employmentOptions,
                                // ),
                              ],
                            ),
                          ),

                          /// ───────────────── DOMAIN KNOWLEDGE ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: _chipMultiSelectField(
                              'Domain Knowledge',
                              controller.domainKnowledge.first,
                              domainKnowledgeOptions,
                            ),
                          ),

                          /// ───────────────── TOOLS & PLATFORMS ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: _chipMultiSelectField(
                              'Tools & Platforms',

                              controller.toolsAndPlatforms.first,

                              toolsOptions,
                            ),
                          ),

                          /// ───────────────── INDUSTRY ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: _chipMultiSelectField(
                              'Industry',
                              controller.industry.first,
                              industryOptions,
                            ),
                          ),

                          /// ───────────────── LINKS ─────────────────
                          /// ───────────────── LINKS ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: ProfileSection(
                              label: 'Links',

                              spacing: 16,

                              children: [
                                _linkField(
                                  controller: controller.github,
                                  hint: 'Github',
                                  asset: 'assets/images/github.png',
                                ),

                                _linkField(
                                  controller: controller.linkedin,
                                  hint: 'LinkedIn',
                                  asset: 'assets/images/linkedin.png',
                                ),

                                _linkField(
                                  controller: controller.portfolio,
                                  hint: 'Portfolio',
                                  asset: 'assets/images/portfolio.png',
                                ),

                                _linkField(
                                  controller: controller.resume,
                                  hint: 'Resume URL',
                                  asset: 'assets/images/cv.png',
                                ),
                              ],
                            ),
                          ),

                          /// ───────────────── ACHIEVEMENTS ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: Column(
                              children: [
                                ProfileSection(
                                  label: 'Achievements',

                                  trailing: _addButton(() {
                                    setState(() {
                                      controller.achievements.add(
                                        AchievementController(),
                                      );
                                    });
                                  }),

                                  children: controller.achievements
                                      .map(_achievementForm)
                                      .toList(),
                                ),

                                const SizedBox(height: 20),

                                ProfileSection(
                                  label: 'Awards',

                                  trailing: _addButton(() {
                                    setState(() {
                                      controller.awards.add(AwardController());
                                    });
                                  }),

                                  children: controller.awards
                                      .map(_awardForm)
                                      .toList(),
                                ),
                              ],
                            ),
                          ),

                          /// ───────────────── PUBLICATIONS ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: ProfileSection(
                              label: 'Publications',

                              trailing: _addButton(() {
                                setState(() {
                                  controller.publications.add(
                                    PublicationController(),
                                  );
                                });
                              }),

                              children: controller.publications
                                  .map(_publicationForm)
                                  .toList(),
                            ),
                          ),

                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: _chipMultiSelectField(
                              'Languages Known',
                              controller.languagesKnown.first,
                              languageOptions,
                            ),
                          ),

                          /// ───────────────── LANGUAGES KNOWN ─────────────────
                        ],
                      ),
                    ),
                  ),

                  /// 🔥 BOTTOM BUTTONS
                  SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                      child: Row(
                        children: [
                          /// SAVE
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

                                onPressed: () async {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  if (widget.isSwitchingToProfessional) {
                                    final body = controller.toMap();
                                    body["profileType"] = "professional";

                                    await getIt<NetworkService>().request(
                                      Request(
                                        method: RequestMethod.put,
                                        endpoint: "/api/onboarding/update",
                                        isSafeRoute: true,
                                        body: body,
                                      ),
                                    );
                                  }
                                  // Validate current experience
                                  for (final exp in controller.experiences) {
                                    if (exp.isCurrent &&
                                        exp.company.text.trim().isEmpty) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Company name is required for your current job.",
                                          ),
                                        ),
                                      );
                                      return;
                                    }
                                  }
                                  final hasCurrentExperience = controller
                                      .experiences
                                      .any((e) => e.isCurrent);

                                  if (!hasCurrentExperience &&
                                      controller.statusType.text
                                          .trim()
                                          .isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Please select your current status.",
                                        ),
                                      ),
                                    );
                                    return;
                                  }
                                  final failure = await addEditProfileViewModel
                                      .saveProfile();

                                  if (failure == null) {
                                    hasChanges = false;

                                    try {
                                      final response =
                                          await getIt<NetworkService>().request(
                                            Request(
                                              method: RequestMethod.get,
                                              endpoint: "api/onboarding/me",
                                              isSafeRoute: true,
                                            ),
                                          );

                                      final latestUser = User.fromJson(
                                        response.data,
                                      );

                                      if (mounted) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              widget.isSwitchingToProfessional
                                                  ? "Switched successfully"
                                                  : "Saved successfully",
                                            ),
                                          ),
                                        );
                                      }

                                      context.read<AppStateProvider>().data =
                                          latestUser;

                                      setState(() {});
                                      if (mounted) {
                                        if (widget.isSwitchingToProfessional) {
                                          context.goNamed(RouteNames.splash);
                                        } else {
                                          context.pop(true);
                                        }
                                      }
                                    } catch (e) {
                                      debugPrint("Refresh profile failed: $e");
                                    }
                                  }
                                },
                                child: Text(
                                  widget.isSwitchingToProfessional
                                      ? "Switch"
                                      : "Save",
                                  style: TextStyle(
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
                  ),
                ],
              ),
            ),
          ),
          // Loading overlay
          Selector<AddEditProfileViewModel, bool>(
            selector: (_, vm) => vm.isLoading,
            builder: (_, isLoading, _) {
              if (_isParsingResume || isLoading) {
                return Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.45),
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Widget _experienceCard(
    ExperienceController e,
    int index, {
    String title = "Experience",
  }) {
    final hasCurrentExperience = controller.experiences.any((e) => e.isCurrent);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(index, "Experience", () {
            setState(() {
              controller.experiences.removeAt(index);
            });
          }),
          const SizedBox(height: 12),

          _companyField(e),
          const SizedBox(height: 12),

          _roleField(e.role),
          const SizedBox(height: 10),

          _currentCheckbox(e),

          const SizedBox(height: 12),

          if (e.isCurrent) ...[
            AppTextFields(
              controller: controller.companyEmail,

              hint: 'Official Company Email',

              keyboardType: TextInputType.emailAddress,

              helperText: "Used for company verification",

              onChanged: (_) => markChanged(),
            ),

            const SizedBox(height: 12),
            const SizedBox(height: 12),

            AppTextFields(
              controller: controller.noticePeriod,

              hint: 'Notice Period (days)',

              keyboardType: TextInputType.number,

              onChanged: (_) => markChanged(),
            ),
          ],

          const SizedBox(height: 10),

          _dateRow(e),

          const SizedBox(height: 12),

          _descriptionField(e),
        ],
      ),
    );
  }

  Widget _leadershipCard(LeadershipExperienceController e, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(index, "Leadership", () {
            setState(() {
              controller.leadershipExperiences.removeAt(index);
            });
          }),

          const SizedBox(height: 12),
          CommonAutocomplete(
            label: "Company",

            hint: "Company",

            options: companyOptions,
            showCreateOption: true,

            onCreate: (value) async {
              await addCompanyIfNeeded(value);

              e.organization.text = value;

              markChanged();

              setState(() {});
            },
            initialValue: e.organization.text,

            onChanged: (value) {
              e.organization.text = value;

              markChanged();
            },

            onSubmitted: (value) async {
              FocusScope.of(context).unfocus();
              await addCompanyIfNeeded(value);

              e.organization.text = value;

              markChanged();
            },

            onSelected: (value) async {
              FocusScope.of(context).unfocus();
              await addCompanyIfNeeded(value);

              e.organization.text = value;

              markChanged();
            },
          ),

          const SizedBox(height: 12),

          _roleField(e.role),
          const SizedBox(height: 12),

          _dateRowOnly(e.startDate, e.endDate),

          const SizedBox(height: 12),

          _input(controller: e.description, hint: "Description", maxLines: 3),
        ],
      ),
    );
  }

  Widget _header(int index, String title, VoidCallback onRemove) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title ${index + 1}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: onRemove,
          child: const Text("Remove", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }

  Widget _companyField(ExperienceController e) {
    return CommonAutocomplete(
      label: "Company",

      hint: "Company",

      options: companyOptions,
      showCreateOption: true,
      initialValue: e.company.text,
      onCreate: (value) async {
        await addCompanyIfNeeded(value);

        e.company.text = value;

        if (e.isCurrent) {
          controller.currentCompany.text = value;
        }

        markChanged();

        setState(() {});
      },
      onChanged: (value) {
        e.company.text = value;

        /// auto update current company
        if (e.isCurrent) {
          controller.currentCompany.text = value;
        }

        markChanged();
      },
      onSubmitted: (value) async {
        FocusScope.of(context).unfocus();
        await addCompanyIfNeeded(value);

        e.company.text = value;

        /// auto update current company
        if (e.isCurrent) {
          controller.currentCompany.text = value;
        }

        markChanged();
      },

      onSelected: (value) async {
        FocusScope.of(context).unfocus();
        await addCompanyIfNeeded(value);

        e.company.text = value;

        /// auto update current company
        if (e.isCurrent) {
          controller.currentCompany.text = value;
        }

        markChanged();
      },
    );
  }

  Widget _roleField(TextEditingController controller) {
    return CommonAutocomplete(
      label: "Role",

      hint: "Role",

      options: jobRoleOptions,

      initialValue: controller.text,

      onChanged: (value) {
        controller.text = value;

        markChanged();
      },

      onSubmitted: (value) async {
        FocusScope.of(context).unfocus();
        await addJobRoleIfNeeded(value);

        controller.text = value;

        markChanged();
      },

      onSelected: (value) async {
        FocusScope.of(context).unfocus();
        await addJobRoleIfNeeded(value);

        controller.text = value;

        markChanged();
      },

      showCreateOption: true,

      onCreate: (value) async {
        await addJobRoleIfNeeded(value);

        controller.text = value;

        markChanged();
      },
    );
  }

  Widget _currentCheckbox(ExperienceController e) {
    return Row(
      children: [
        Checkbox(
          value: e.isCurrent,
          onChanged: (val) {
            setState(() {
              e.isCurrent = val ?? false;
              if (e.isCurrent) {
                controller.statusType.clear();
                controller.statusSince.clear();
                controller.statusNote.clear();
                controller.expectedReturn.clear();
              }

              /// remove current flag from others
              for (final exp in controller.experiences) {
                if (exp != e) {
                  exp.isCurrent = false;
                }
              }

              final currentExp = controller.experiences.where(
                (exp) => exp.isCurrent,
              );

              /// if none selected -> EMPTY STRING
              if (currentExp.isEmpty) {
                controller.currentCompany.text = '';
              } else {
                controller.currentCompany.text = currentExp.first.company.text;
              }
            });

            markChanged();
          },
        ),
        const Text(
          "I currently work here",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _dateRow(ExperienceController e) {
    return Row(
      children: [
        Expanded(child: _dateField(e.startDate, "Start Date")),
        const SizedBox(width: 10),
        Expanded(
          child: _dateField(
            e.endDate,
            "End Date",
            enabled: !e.isCurrent, // 🔥 disable if current job
          ),
        ),
      ],
    );
  }

  Widget _dateField(
    TextEditingController controller,
    String hint, {
    bool enabled = true,
    bool allowFuture = false,
  }) {
    return GestureDetector(
      onTap: !enabled
          ? null
          : () async {
              final now = DateTime.now();

              final date = await showDatePicker(
                context: context,
                initialDate: now,
                firstDate: DateTime(2000),
                lastDate: allowFuture ? DateTime(2100) : now,
              );

              if (date != null) {
                controller.text =
                    "${date.day.toString().padLeft(2, '0')}/"
                    "${date.month.toString().padLeft(2, '0')}/"
                    "${date.year}";
              }
            },
      child: AbsorbPointer(
        child: _input(controller: controller, hint: hint, enabled: enabled),
      ),
    );
  }

  Widget _descriptionField(ExperienceController e) {
    return _input(
      controller: e.description,
      hint: "Briefly describe your responsibilities...",
      maxLines: 3,
      onChanged: (_) => markChanged(),
    );
  }

  Widget _statusSection() {
    final statuses = isProfessional ? professionalStatuses : studentStatuses;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Current Status",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: statuses.map((status) {
            final selected = controller.statusType.text == status;

            return ChoiceChip(
              selected: selected,
              backgroundColor: Colors.black,
              selectedColor: Colors.black,
              side: BorderSide(
                color: selected ? Colors.white : Colors.grey.shade700,
              ),
              label: Text(
                status.replaceAll("_", " "),
                style: const TextStyle(color: Colors.white),
              ),
              onSelected: (_) {
                setState(() {
                  controller.statusType.text = status;

                  if (status != "career_break") {
                    controller.expectedReturn.clear();
                  }
                });

                markChanged();
              },
            );
          }).toList(),
        ),

        const SizedBox(height: 16),

        _dateField(controller.statusSince, "Since"),

        const SizedBox(height: 12),

        if (controller.statusType.text == "career_break") ...[
          _datePickerField(
            controller.expectedReturn,
            "Expected Return",
            allowFuture: true,
          ),
          const SizedBox(height: 12),
        ],

        AppTextFields(
          controller: controller.statusNote,
          hint: "Note",
          maxLines: 3,
          onChanged: (_) => markChanged(),
        ),
      ],
    );
  }

  Widget _input({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
    ValueChanged<String>? onChanged,

    bool enabled = true,
  }) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      maxLines: maxLines,
      enabled: enabled,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF1F2937),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // /// Specialization dropdown — options are driven by the selected degree.
  // Widget _specializationDropdownField() {
  //   return CommonAutocomplete(
  //     label: "Specialization",

  //     hint: "Specialization",

  //     onSubmitted: (value) async {
  //       FocusScope.of(context).unfocus();
  //       await addStreamIfNeeded(value);
  //     },

  //     options: streams.map((e) => e['value'].toString()).toList(),

  //     initialValue: controller.specialization.text,

  //     onChanged: (value) async {
  //       controller.specialization.text = value;

  //       markChanged();

  //       final exists = streams.any(
  //         (e) => e['value'].toString().toLowerCase() == value.toLowerCase(),
  //       );

  //       if (!exists && value.trim().isNotEmpty) {
  //         await addStreamIfNeeded(value);
  //       }
  //     },

  //     onSelected: (value) {
  //       FocusScope.of(context).unfocus();
  //       controller.specialization.text = value;

  //       markChanged();
  //     },
  //   );
  // }

  // ── Sub-form builders ────────────────────────────────────────────────────────
  Widget _achievementForm(AchievementController a) => Column(
    spacing: 16,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Achievement ${controller.achievements.indexOf(a) + 1}',
        style: AppTextStyles.s14W600.copyWith(color: AppColors.white),
      ),

      AppTextFields(
        controller: a.title,
        hint: 'Title',
        onChanged: (_) => markChanged(),
      ),

      AppTextFields(
        controller: a.event,
        hint: 'Event',
        onChanged: (_) => markChanged(),
      ),

      _datePickerField(a.date, 'Date'),

      // const AppDivider(),
    ],
  );
  Widget _awardForm(AwardController a) => Column(
    spacing: 16,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Award ${controller.awards.indexOf(a) + 1}',
        style: AppTextStyles.s14W600.copyWith(color: AppColors.white),
      ),

      AppTextFields(
        controller: a.title,
        hint: 'Title',
        onChanged: (_) => markChanged(),
      ),

      AppTextFields(
        controller: a.organization,
        hint: 'Organization',
        onChanged: (_) => markChanged(),
      ),
      _datePickerField(a.startDate, 'Start Date'),
      _datePickerField(a.endDate, 'End Date'),

      AppTextFields(
        controller: a.description,
        hint: 'Description',
        onChanged: (_) => markChanged(),
      ),

      // const AppDivider(),
    ],
  );
  Widget _linkField({
    required TextEditingController controller,
    required String hint,
    required String asset,
  }) {
    return TextFormField(
      controller: controller,

      style: const TextStyle(color: Colors.white),

      decoration: InputDecoration(
        hintText: hint,

        hintStyle: const TextStyle(color: Colors.grey),

        filled: true,

        fillColor: const Color(0xFF1F2937),

        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(asset, width: 22, height: 22),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),

      onChanged: (_) => markChanged(),
    );
  }

  Widget _publicationForm(PublicationController p) => Column(
    spacing: 16,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Publication ${controller.publications.indexOf(p) + 1}',
        style: AppTextStyles.s14W600.copyWith(color: Colors.white),
      ),
      AppTextFields(
        controller: p.title,
        hint: 'Title',
        onChanged: (_) => markChanged(),
      ),

      AppTextFields(
        controller: p.url,
        hint: 'URL',
        onChanged: (_) => markChanged(),
      ),

      // const AppDivider(),
    ],
  );
  Widget _internationalCard(InternationalExperienceController e, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(index, "International", () {
            setState(() {
              controller.internationalExperiences.removeAt(index);
            });
          }),

          const SizedBox(height: 12),

          _dropdownField(e.country, "Country", countryOptions),
          const SizedBox(height: 12),

          CommonAutocomplete(
            label: "Organization",
            showCreateOption: true,

            onCreate: (value) async {
              await addCompanyIfNeeded(value);

              e.organization.text = value;

              markChanged();

              setState(() {});
            },
            hint: "Organization",

            options: companyOptions,

            initialValue: e.organization.text,

            onChanged: (value) {
              e.organization.text = value;

              markChanged();
            },

            onSubmitted: (value) async {
              FocusScope.of(context).unfocus();
              await addCompanyIfNeeded(value);

              e.organization.text = value;

              markChanged();
            },

            onSelected: (value) async {
              FocusScope.of(context).unfocus();
              await addCompanyIfNeeded(value);

              e.organization.text = value;

              markChanged();
            },
          ),
          const SizedBox(height: 12),

          _roleField(e.role),

          const SizedBox(height: 12),

          _dateRowOnly(e.startDate, e.endDate),

          const SizedBox(height: 12),

          _input(controller: e.description, hint: "Description", maxLines: 3),
        ],
      ),
    );
  }

  Widget _dateRowOnly(TextEditingController start, TextEditingController end) {
    return Row(
      children: [
        Expanded(child: _dateField(start, "Start Date")),

        const SizedBox(width: 10),

        Expanded(child: _dateField(end, "End Date")),
      ],
    );
  }
  // ── Reusable field helpers ───────────────────────────────────────────────────

  Widget _profileListSection(String label, List<TextEditingController> list) {
    return ProfileSection(
      label: label,
      trailing: _addButton(() {
        setState(() => list.add(TextEditingController()));
      }),
      children: list
          .map(
            (e) => AppTextFields(
              controller: e,
              hint: '$label ${list.indexOf(e) + 1}',
            ),
          )
          .toList(),
    );
  }

  Widget _addButton(VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        '+ Add',
        style: AppTextStyles.s16W400.copyWith(color: AppColors.primary),
      ),
    );
  }

  Widget _dropdownField(
    TextEditingController ctrl,
    String hint,
    List<String> options,
  ) {
    final selectedValue = options.contains(ctrl.text) ? ctrl.text : null;

    return DropdownButtonFormField<String>(
      value: selectedValue,

      dropdownColor: const Color(0xFF1F2937), // 🔥 dark grey dropdown bg

      style: AppTextStyles.s16W400.copyWith(color: AppColors.white),

      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.border),
          borderRadius: BorderRadius.circular(8),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kGreen),
          borderRadius: BorderRadius.circular(8),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(8),
        ),

        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorBorder),
          borderRadius: BorderRadius.circular(8),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kGreen),
          borderRadius: BorderRadius.circular(8),
        ),

        labelText: hint,

        labelStyle: AppTextStyles.s16W500.copyWith(color: AppColors.white),

        floatingLabelStyle: AppTextStyles.s16W400.copyWith(
          color: AppColors.white,
        ),

        isDense: true,
      ),

      iconEnabledColor: AppColors.white,

      items: options.map((e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Text(
            e,
            style: TextStyle(
              color: Colors.grey.shade300, // 🔥 option text color
            ),
          ),
        );
      }).toList(),

      onChanged: (val) {
        setState(() {
          ctrl.text = val ?? '';
        });

        markChanged();
      },
    );
  }

  Widget _datePickerField(
    TextEditingController ctrl,
    String hint, {
    bool allowFuture = false,
  }) {
    return TextFormField(
      controller: ctrl,
      readOnly: true,

      style: const TextStyle(color: Colors.white),

      decoration: InputDecoration(
        hintText: hint,

        hintStyle: const TextStyle(color: Colors.white70),

        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),

        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),

        suffixIcon: const Icon(
          Icons.calendar_today_outlined,
          size: 20,
          color: Colors.white,
        ),
      ),

      onTap: () async {
        final now = DateTime.now();

        DateTime initial;

        try {
          initial = ctrl.text.isNotEmpty
              ? DateTime.parse(ctrl.text)
              : DateTime(now.year - 20);
        } catch (_) {
          initial = DateTime(now.year - 20);
        }

        final picked = await showDatePicker(
          context: context,
          initialDate: initial,
          firstDate: DateTime(1940),
          lastDate: allowFuture ? DateTime(2100) : now,
        );

        if (picked != null) {
          setState(() {
            ctrl.text =
                "${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";

            markChanged();
          });
        }
      },
    );
  }

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
      onChanged: markChanged,
    );
  }

  Map<String, dynamic>? calculateNoticePeriodStatus(
    String? startDateStr,
    String? totalDaysStr,
  ) {
    if (startDateStr == null ||
        startDateStr.isEmpty ||
        totalDaysStr == null ||
        totalDaysStr.isEmpty) {
      return null;
    }

    try {
      final totalDays = int.tryParse(totalDaysStr) ?? 0;

      if (totalDays <= 0) {
        return null;
      }

      /// NOTICE START DATE
      final startDate = DateTime.parse(startDateStr);

      /// TODAY
      final now = DateTime.now();

      /// REMOVE TIME PART
      final start = DateTime(startDate.year, startDate.month, startDate.day);

      final today = DateTime(now.year, now.month, now.day);

      /// DAYS SERVED
      int daysPassed = today.difference(start).inDays;

      if (daysPassed < 0) {
        daysPassed = 0;
      }

      /// DAYS REMAINING
      int daysRemaining = totalDays - daysPassed;

      if (daysRemaining < 0) {
        daysRemaining = 0;
      }

      /// END DATE
      final endDate = start.add(Duration(days: totalDays));

      /// PROGRESS
      final progress = (daysPassed / totalDays).clamp(0.0, 1.0);

      return {
        "daysPassed": daysPassed,

        "daysRemaining": daysRemaining,

        "totalDays": totalDays,

        "progress": progress,

        "isExpired": daysPassed >= totalDays,

        "endDate":
            "${endDate.day.toString().padLeft(2, '0')}/"
            "${endDate.month.toString().padLeft(2, '0')}/"
            "${endDate.year}",
      };
    } catch (e) {
      return null;
    }
  }

  // ── Resume parser ────────────────────────────────────────────────────────────
  Future<void> parseResumeAndFill() async {
    try {
      debugPrint("Starting resume upload");

      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        withData: false,
      );

      if (result == null) {
        debugPrint("No file selected");
        return;
      }

      final file = result.files.single;

      if (file.path == null) {
        debugPrint("File path is null");
        return;
      }

      _pickedResumeFile = File(file.path!);

      addEditProfileViewModel.pickedResumeFile = _pickedResumeFile;

      setState(() {
        _isParsingResume = true;
      });

      /// 🔥 FORM DATA
      final formData = FormData.fromMap({
        'resume': await MultipartFile.fromFile(file.path!, filename: file.name),
      });

      /// 🔥 NETWORK CALL
      final networkService = NetworkService();

      final response = await networkService.request(
        Request(
          method: RequestMethod.post,

          endpoint: "/api/upload/resume",

          formData: formData,

          isSafeRoute: true,
        ),
      );

      debugPrint("STATUS: ${response.statusCode}");

      debugPrint("FULL RESPONSE: ${response.data}");

      /// 🔥 SAFE PARSING
      final data = response.data["data"] ?? response.data;

      if (data == null) {
        debugPrint("No data found in response");

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Resume upload failed")));

        return;
      }

      debugPrint("PARSED DATA: $data");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Resume uploaded successfully")),
      );

      /// 🔥 BASIC FIELDS
      controller.name.text = data['name'] ?? controller.name.text;

      controller.email.text = data['email'] ?? controller.email.text;

      controller.phone.text = data['phone'] ?? controller.phone.text;

      controller.gender.text = data['gender'] ?? controller.gender.text;

      controller.about.text = data['about'] ?? controller.about.text;

      controller.linkedin.text =
          data['linkedin_url'] ?? controller.linkedin.text;

      controller.github.text = data['github_url'] ?? controller.github.text;

      controller.portfolio.text =
          data['portfolio_url'] ?? controller.portfolio.text;

      /// 🔥 SKILLS
      if (data['skills'] != null &&
          data['skills'] is List &&
          controller.skills.isNotEmpty) {
        controller.skills.first.text = (data['skills'] as List).join(', ');
      }

      /// 🔥 EDUCATIONS
      if (data['education'] != null &&
          data['education'] is List &&
          (data['education'] as List).isNotEmpty) {
        controller.educations.clear();

        for (final edu in data['education']) {
          final education = EducationController();

          /// COLLEGE
          education.college.text = edu['institution'] ?? '';

          /// DEGREE
          final parsedDegree = edu['degree']?.toString() ?? '';

          education.degree.text = parsedDegree;

          if (parsedDegree.isNotEmpty &&
              !degreeOptions.contains(parsedDegree)) {
            degreeOptions.add(parsedDegree);
          }

          /// SPECIALIZATION
          final parsedSpec = edu['field_of_study']?.toString() ?? '';

          education.specialization.text = parsedSpec;

          /// YEAR
          education.yearOfGraduation.text = edu['year']?.toString() ?? '';

          /// CGPA
          education.cgpa.text = edu['cgpa']?.toString() ?? '';

          /// EDUCATION TYPE
          education.educationType = "bachelors";

          /// CURRENT
          education.isCurrent = false;

          /// 🔥 FETCH STREAMS
          final selected = degrees.firstWhere(
            (d) =>
                d['value'].toString().toLowerCase() ==
                parsedDegree.toLowerCase(),

            orElse: () => {},
          );

          if (selected.isNotEmpty) {
            education.selectedDegreeId = selected['_id'];

            final response = await getIt<NetworkService>().request(
              Request(
                method: RequestMethod.get,

                endpoint:
                    "api/master-data?type=STREAM&parent=${education.selectedDegreeId}",

                isSafeRoute: true,
              ),
            );

            education.streams = List<Map<String, dynamic>>.from(
              response.data['data'] ?? [],
            );
          }

          controller.educations.add(education);
        }
      }

      setState(() {});
    } catch (e, s) {
      debugPrint("FULL ERROR: $e");

      debugPrint("STACK: $s");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Something went wrong")));
    } finally {
      setState(() {
        _isParsingResume = false;
      });
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  _ChipMultiSelectField  — proper StatefulWidget (no rebuild-controller bug)
// ─────────────────────────────────────────────────────────────────────────────

class _ChipMultiSelectField extends StatefulWidget {
  const _ChipMultiSelectField({
    required this.label,
    required this.controller,
    required this.options,
    this.onChanged,
    super.key,
  });

  final String label;
  final TextEditingController controller;
  final List<String> options;
  final VoidCallback? onChanged;
  @override
  State<_ChipMultiSelectField> createState() => _ChipMultiSelectFieldState();
}

class _ChipMultiSelectFieldState extends State<_ChipMultiSelectField> {
  final TextEditingController _textController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

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
      setState(() {});
    }

    setState(() {});
  }

  // void _toggleEnumChip(String value) {
  //   final current = _selectedItems;

  //   if (current.contains(value)) {
  //     current.remove(value);

  //     _sync(current);

  //     if (value == 'Others') {
  //       _showFreeText = false;
  //     }
  //   } else {
  //     current.add(value);

  //     _sync(current);

  //     if (value == 'Others') {
  //       _showFreeText = true;
  //     }
  //   }

  //   setState(() {});
  // }

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
        .map((e) => e.trim())
        .where((option) {
          final normalized = option.toLowerCase().replaceAll(' ', '');

          return option.toLowerCase().contains(query) &&
              !selectedNormalized.contains(normalized);
        })
        .toSet()
        .toList()
      ..sort();
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
                          .findAncestorStateOfType<_AddEditProfileViewState>();

                      if (widget.label == 'Skills') {
                        await parentState?.addSkillIfNeeded(value);
                      }

                      if (widget.label == 'Job Roles') {
                        await parentState?.addJobRoleIfNeeded(value);
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
