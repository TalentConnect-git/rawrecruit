import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_profile/presentation/widgets/auto_complete_field.dart';
import 'package:rawrecruit/src/features/onboarding/data/entities/leadership_controller.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart';
import 'package:rawrecruit/src/features/onboarding/presentation/view_model/add_edit_profile_view_model.dart';
import 'package:rawrecruit/src/features/onboarding/presentation/widgets/profile_image.dart';
import '../data/entities/international.dart';


class AddEditProfileView extends StatefulWidget {
  const AddEditProfileView({this.user, this.initialStep, super.key});
  final int? initialStep;
  final User? user;

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

  /// Specialization options keyed by degree.
  /// Falls back to [_defaultSpecializations] if degree not found.
  static const Map<String, List<String>> _specializationByDegree = {
    "B.Tech": [
      "Computer Science & Engineering",
      "Information Technology",
      "Electronics & Communication Engineering",
      "Electrical Engineering",
      "Mechanical Engineering",
      "Civil Engineering",
      "Chemical Engineering",
      "Aerospace Engineering",
      "Biotechnology",
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
      "Chemical Engineering",
      "Production Engineering",
      "Instrumentation Engineering",
      "Other",
    ],
    "Bachelor of Science": [
      "Computer Science",
      "Physics",
      "Chemistry",
      "Mathematics",
      "Statistics",
      "Biology",
      "Biochemistry",
      "Environmental Science",
      "Microbiology",
      "Data Science",
      "Other",
    ],
    "BCA": [
      "Computer Applications",
      "Software Development",
      "Data Analytics",
      "Cloud Computing",
      "Cybersecurity",
      "Other",
    ],
    "B.Com": [
      "Accounting & Finance",
      "Banking & Insurance",
      "Taxation",
      "Business Economics",
      "E-Commerce",
      "Other",
    ],
    "BA": [
      "English Literature",
      "History",
      "Political Science",
      "Economics",
      "Psychology",
      "Sociology",
      "Philosophy",
      "Mass Communication",
      "Journalism",
      "Other",
    ],
    "M.Tech": [
      "Computer Science & Engineering",
      "Data Science & Machine Learning",
      "VLSI Design",
      "Embedded Systems",
      "Software Engineering",
      "Cybersecurity",
      "Robotics & Automation",
      "Thermal Engineering",
      "Structural Engineering",
      "Power Systems",
      "Other",
    ],
    "M.E": [
      "Computer Engineering",
      "Electronics Engineering",
      "Structural Engineering",
      "Thermal Engineering",
      "Manufacturing Engineering",
      "Other",
    ],
    "MSc": [
      "Computer Science",
      "Data Science",
      "Physics",
      "Chemistry",
      "Mathematics",
      "Statistics",
      "Biotechnology",
      "Environmental Science",
      "Other",
    ],
    "MBA": [
      "Finance",
      "Marketing",
      "Human Resources",
      "Operations Management",
      "Information Technology",
      "Business Analytics",
      "International Business",
      "Entrepreneurship",
      "Supply Chain Management",
      "Other",
    ],
    "MCA": [
      "Software Engineering",
      "Data Science",
      "Cloud Computing",
      "Cybersecurity",
      "Artificial Intelligence",
      "Other",
    ],
    "PhD": [
      "Computer Science",
      "Electronics",
      "Mechanical Engineering",
      "Civil Engineering",
      "Physics",
      "Chemistry",
      "Mathematics",
      "Management",
      "Life Sciences",
      "Social Sciences",
      "Other",
    ],
    "Diploma": [
      "Computer Engineering",
      "Electronics & Telecommunication",
      "Mechanical Engineering",
      "Civil Engineering",
      "Electrical Engineering",
      "Information Technology",
      "Other",
    ],
    "Other": ["Other"],
  };

  static const List<String> _defaultSpecializations = ["Other"];

  /// Returns the specialization options for the currently selected degree.
  List<String> get _currentSpecializationOptions {
    final deg = controller.degree.text;
    if (deg.isEmpty) return _defaultSpecializations;
    return _specializationByDegree[deg] ?? _defaultSpecializations;
  }

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

  final jobRoleOptions = [
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

    fetchDegrees();

    fetchCompanies();

    fetchSkills();
    addEditProfileViewModel.setUserController(widget.user);
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
                                  ],
                                ),
                              ],
                            ),
                          ),

                          /// ───────────────── EDUCATION ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: ProfileSection(
                              label: 'Education',

                              spacing: 16,

                              children: [
                                CommonAutocomplete(
                                  label: "College",
                                  hint: "College",

                                  options: colleges
                                      .map((e) => e['label'].toString())
                                      .toList(),

                                  initialValue: controller.college.text,

                                  onChanged: (value) {
                                    controller.college.text = value;
                                    markChanged();
                                  },

                                  onSelected: (value) async {
                                    await addCollegeIfNeeded(value);
                                    controller.college.text = value;
                                    markChanged();
                                  },

                                  onSubmitted: (value) async {
                                    await addCollegeIfNeeded(value);
                                    controller.college.text = value;
                                    markChanged();
                                  },

                                  /// 🔥 NEW (IMPORTANT)
                                  ///
                                  showCreateOption: true,

                                  onCreate: (value) async {
                                    await addCollegeIfNeeded(value);
                                    controller.college.text = value;
                                    markChanged();
                                  },
                                ),
                                _degreeDropdownField(),

                                _specializationDropdownField(),

                                if (!isProfessional && !isFresher)
                                  _dropdownField(
                                    controller.semester,
                                    'Semester',
                                    semesterOptions,
                                  ),

                                _dropdownField(
                                  controller.yearOfGraduation,
                                  'Graduation Year',
                                  graduationYears,
                                ),

                                if (!isProfessional)
                                  AppTextFields(
                                    controller: controller.cgpa,



                                    hint: 'CGPA',

                                    onChanged: (_) => markChanged(),
                                  ),
                              ],
                            ),
                          ),

                          /// ───────────────── LINKS ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: ProfileSection(
                              label: 'Links',

                              spacing: 16,

                              children: [
                                AppTextFields(
                                  controller: controller.github,

                                  hint: 'Github',

                                  onChanged: (_) => markChanged(),
                                ),

                                AppTextFields(
                                  controller: controller.linkedin,

                                  hint: 'LinkedIn',

                                  onChanged: (_) => markChanged(),
                                ),

                                AppTextFields(
                                  controller: controller.portfolio,

                                  hint: 'Portfolio',

                                  onChanged: (_) => markChanged(),
                                ),

                                AppTextFields(
                                  controller: controller.resume,

                                  hint: 'Resume URL',

                                  onChanged: (_) => markChanged(),
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
  controller:
      controller.totalYearsOfExperience,

  hint: 'Total Years Of Experience',

  keyboardType: TextInputType.text,

  onChanged: (_) => markChanged(),
),
const SizedBox(height: 12),

AppTextFields(
  controller: controller.companyEmail,

  hint: 'Official Company Email',

  keyboardType: TextInputType.emailAddress,

  onChanged: (_) => markChanged(),
),
                                  AppTextFields(
                                    controller: controller.noticePeriod,

                                    hint: 'Notice Period (days)',

                                    onChanged: (_) => markChanged(),
                                  ),

                                  const SizedBox(height: 12),
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
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      Switch(
        value:
            controller.servingNoticePeriod,

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
    final notice =
        calculateNoticePeriodStatus(
      controller.noticePeriodStartDate.text,
      controller.noticePeriod.text,
    );

    if (notice == null ||
        controller.servingNoticePeriod != true) {
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

                    fontWeight:
                        FontWeight.bold,
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
            value: notice["progress"] / 100,
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
                                  [
                                    'full time',
                                    'part time',
                                    'contract',
                                    'Internship',
                                  ],
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

                                _profileListSection(
                                  'Locations',
                                  controller.locations,
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

                          /// ───────────────── LANGUAGES KNOWN ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: _chipMultiSelectField(
                              'Languages Known',
                              controller.languagesKnown.first,
                              languageOptions,
                            ),
                          ),

                          /// ───────────────── JOB ROLES ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: _chipMultiSelectField(
                              'Job Roles',
                              controller.jobRoles.first,
                              jobRoleOptions,
                            ),
                          ),

                          /// ───────────────── SKILLS ─────────────────
                          /// ───────────────── SKILLS ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: _chipMultiSelectField(
                              'Skills',
                              controller.skills.first,
                              skillOptionsApi,
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

                          /// ───────────────── INDUSTRY ─────────────────
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16),

                            child: _chipMultiSelectField(
                              'Industry',
                              controller.industry.first,
                              industryOptions,
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

                              children: controller.experiences
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                    final index = entry.key;

                                    final e = entry.value;

                                    return _experienceCard(e, index);
                                  })
                                  .toList(),
                            ),
                          ),

   SingleChildScrollView(
  padding: const EdgeInsets.all(16),

  child: ProfileSection(
    label: 'Leadership Experience',

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
SingleChildScrollView(
  padding: const EdgeInsets.all(16),

  child: ProfileSection(
    label: 'International Experience',

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
                        ],
                      ),
                    ),
                  ),

                  /// 🔥 BOTTOM BUTTONS
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

                                  final failure = await addEditProfileViewModel
                                      .saveProfile();

                                  if (failure == null) {
                                    hasChanges = false;

                                    if (mounted) {
                                      context.pop(true);
                                    }
                                  }if (failure == null) {
  hasChanges = false;

  try {
    final response = await getIt<NetworkService>().request(
      Request(
        method: RequestMethod.get,
        endpoint: "api/onboarding/me",
        isSafeRoute: true,
      ),
    );

    final latestUser = User.fromJson(response.data["data"]);

    context.read<AppStateProvider>().data = latestUser;
  } catch (e) {
    debugPrint("Refresh profile failed: $e");
  }

  if (mounted) {
    context.pop(true);
  }
}
                                },
                                child: const Text(
                                  "Save",

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // const SizedBox(width: 12),

                          // /// NEXT
                          // Expanded(
                          //   child: SizedBox(
                          //     height: 56,

                          //     child: ElevatedButton(
                          //       style: ElevatedButton.styleFrom(
                          //         backgroundColor: AppColors.kGreen,

                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(12),
                          //         ),
                          //       ),

                          //       onPressed: () async {
                          //         if (!_formKey.currentState!.validate()) {
                          //           return;
                          //         }

                          //         final failure = await addEditProfileViewModel
                          //             .saveProfile();

                          //         if (failure == null) {
                          //           hasChanges = false;

                          //           if (currentStep == totalSteps - 1) {
                          //             if (mounted) {
                          //               context.pop(true);
                          //             }
                          //           } else {
                          //             nextStep();
                          //           }
                          //         }
                          //       },

                          //       child: Text(
                          //         currentStep == totalSteps - 1
                          //             ? "Save Profile"
                          //             : "save and Next",

                          //         style: const TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 16,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
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

  Widget _degreeDropdownField() {
    return CommonAutocomplete(
      label: "Degree",
      hint: "Degree",

      onSubmitted: (value) async {
        await addDegreeIfNeeded(value);

        await fetchDegrees();

        final selected = degrees.firstWhere(
          (e) => e['value'].toString().toLowerCase() == value.toLowerCase(),

          orElse: () => {},
        );

        if (selected.isNotEmpty) {
          selectedDegreeId = selected['_id'];

          await fetchStreams(selectedDegreeId!);
        }
      },

      options: degrees.map((e) => e['value'].toString()).toList(),

      initialValue: controller.degree.text,

      onChanged: (value) {
        controller.degree.text = value;

        markChanged();
      },

      onSelected: (value) async {
        controller.degree.text = value;

        controller.specialization.text = '';

        final selected = degrees.firstWhere(
          (e) => e['value'].toString().toLowerCase() == value.toLowerCase(),

          orElse: () => {},
        );

        if (selected.isNotEmpty) {
          selectedDegreeId = selected['_id'];

          await fetchStreams(selectedDegreeId!);
        }

        setState(() {});

        markChanged();
      },
    );
  }
Widget _experienceCard(
  ExperienceController e,
  int index, {
  String title = "Experience",
}) {
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
        _header(index, title),
          const SizedBox(height: 12),

          _companyField(e),
          const SizedBox(height: 12),

          _roleField(e),
          const SizedBox(height: 10),

          _currentCheckbox(e),

          const SizedBox(height: 10),

          _dateRow(e),

          const SizedBox(height: 12),

          _descriptionField(e),
        ],
      ),
    );
  }
  Widget _leadershipCard(
  LeadershipExperienceController e,
  int index,
) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),

    decoration: BoxDecoration(
      color: const Color(0xFF111827),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: Colors.white.withOpacity(0.06),
      ),
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header(index, "Leadership"),

        const SizedBox(height: 12),
CommonAutocomplete(
  label: "Company",

  hint: "Company",

  options: companyOptions,

  initialValue: e.organization.text,

  onChanged: (value) {
    e.organization.text = value;

    markChanged();
  },

  onSubmitted: (value) async {
    await addCompanyIfNeeded(value);

    e.organization.text = value;

    markChanged();
  },

  onSelected: (value) async {
    await addCompanyIfNeeded(value);

    e.organization.text = value;

    markChanged();
  },
),

        const SizedBox(height: 12),

        _input(
          controller: e.role,
          hint: "Role",
        ),

        const SizedBox(height: 12),

        _dateRowOnly(
          e.startDate,
          e.endDate,
        ),

        const SizedBox(height: 12),

        _input(
          controller: e.description,
          hint: "Description",
          maxLines: 3,
        ),
      ],
    ),
  );
}
Widget _header(
  int index,
  String title,
){
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
          onTap: () {
            setState(() {
              controller.experiences.removeAt(index);
            });
          },
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

      initialValue: e.company.text,

 onChanged: (value) {
  e.company.text = value;

  /// auto update current company
  if (e.isCurrent) {
    controller.currentCompany.text = value;
  }

  markChanged();
},
onSubmitted: (value) async {
  await addCompanyIfNeeded(value);

  e.company.text = value;

  /// auto update current company
  if (e.isCurrent) {
    controller.currentCompany.text = value;
  }

  markChanged();
},

    onSelected: (value) async {
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

  Widget _roleField(ExperienceController e) {
    return _input(
      controller: e.role,
      hint: "e.g., Software Engineer",
      onChanged: (_) => markChanged(),
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

    /// remove current flag from others
    for (final exp in controller.experiences) {
      if (exp != e) {
        exp.isCurrent = false;
      }
    }

    /// auto fill current company
    if (e.isCurrent) {
      controller.currentCompany.text = e.company.text;
    }

    /// clear if unchecked
    if (!e.isCurrent &&
        controller.currentCompany.text == e.company.text) {
      controller.currentCompany.clear();
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
  }) {
    return GestureDetector(
      onTap: !enabled
          ? null
          : () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                initialDate: DateTime.now(),
              );

              if (date != null) {
                controller.text = "${date.month}/${date.year}";
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

  /// Specialization dropdown — options are driven by the selected degree.
  Widget _specializationDropdownField() {
    return CommonAutocomplete(
      label: "Specialization",

      hint: "Specialization",

      onSubmitted: (value) async {
        await addStreamIfNeeded(value);
      },

      options: streams.map((e) => e['value'].toString()).toList(),

      initialValue: controller.specialization.text,

      onChanged: (value) async {
        controller.specialization.text = value;

        markChanged();

        final exists = streams.any(
          (e) => e['value'].toString().toLowerCase() == value.toLowerCase(),
        );

        if (!exists && value.trim().isNotEmpty) {
          await addStreamIfNeeded(value);
        }
      },

      onSelected: (value) {
        controller.specialization.text = value;

        markChanged();
      },
    );
  }

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
  Widget _publicationForm(PublicationController p) => Column(
    spacing: 16,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Publication ${controller.publications.indexOf(p) + 1}',
        style: AppTextStyles.s14W600,
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
Widget _internationalCard(
  InternationalExperienceController e,
  int index,
) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),

    decoration: BoxDecoration(
      color: const Color(0xFF111827),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: Colors.white.withOpacity(0.06),
      ),
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header(index, "International"),

        const SizedBox(height: 12),

        _input(
          controller: e.country,
          hint: "Country",
        ),

        const SizedBox(height: 12),

        _input(
          controller: e.role,
          hint: "Role",
        ),

        const SizedBox(height: 12),

        _dateRowOnly(
          e.startDate,
          e.endDate,
        ),

        const SizedBox(height: 12),

        _input(
          controller: e.description,
          hint: "Description",
          maxLines: 3,
        ),
      ],
    ),
  );
}
Widget _dateRowOnly(
  TextEditingController start,
  TextEditingController end,
) {
  return Row(
    children: [
      Expanded(
        child: _dateField(
          start,
          "Start Date",
        ),
      ),

      const SizedBox(width: 10),

      Expanded(
        child: _dateField(
          end,
          "End Date",
        ),
      ),
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

  Widget _datePickerField(TextEditingController ctrl, String hint) {
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
          lastDate: now,
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

  final totalDays =
      int.tryParse(totalDaysStr) ?? 0;

  if (totalDays <= 0) {
    return null;
  }

  try {
    final start =
        DateTime.parse(startDateStr);

    final today = DateTime.now();

    final normalizedStart = DateTime(
      start.year,
      start.month,
      start.day,
    );

    final normalizedToday = DateTime(
      today.year,
      today.month,
      today.day,
    );

    final daysPassed =
        normalizedToday
            .difference(normalizedStart)
            .inDays;

    final safeDaysPassed =
        daysPassed < 0 ? 0 : daysPassed;

    final daysRemaining =
        (totalDays - safeDaysPassed)
            .clamp(0, totalDays);

    final endDate =
        normalizedStart.add(
      Duration(days: totalDays),
    );

    final progress =
        totalDays == 0
        ? 0.0
        : (safeDaysPassed / totalDays)
              .clamp(0, 1);

    return {
      "daysPassed": safeDaysPassed,

      "daysRemaining": daysRemaining,

      "isExpired":
          safeDaysPassed >= totalDays,

      "progress": progress,

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

      setState(() => _isParsingResume = true);

      /// 🔥 FORM DATA
      final formData = FormData.fromMap({
        'resume': await MultipartFile.fromFile(file.path!, filename: file.name),
      });

      /// 🔥 USE NETWORK SERVICE (IMPORTANT)
      final networkService = NetworkService();

      final response = await networkService.request(
        Request(
          method: RequestMethod.post,
          endpoint: "/api/upload/resume",
          formData: formData,
          isSafeRoute: true, // 🔥 TOKEN AUTOMATIC
        ),
      );

      debugPrint("STATUS: ${response.statusCode}");
      debugPrint("FULL RESPONSE: ${response.data}");

      /// 🔥 SAFE PARSING
      final data = response.data["data"] ?? response.data;

    if (data == null) {
  debugPrint("No data found in response");

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Resume upload failed"),
    ),
  );

  return;
}

      debugPrint("PARSED DATA: $data");
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text("Resume uploaded successfully"),
  ),
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
      if (data['skills'] != null && data['skills'] is List) {
        controller.skills.first.text = (data['skills'] as List).join(', ');
      }

      /// 🔥 EDUCATION
      if (data['education'] != null &&
          data['education'] is List &&
          (data['education'] as List).isNotEmpty) {
        final edu = data['education'].last;

        controller.college.text = controller.college.text.isEmpty
            ? (edu['institution'] ?? '')
            : controller.college.text;

        if (edu['degree'] != null) {
          final parsedDegree = edu['degree'].toString();

          if (!degreeOptions.contains(parsedDegree)) {
            degreeOptions.add(parsedDegree);
          }

          controller.degree.text = parsedDegree;
          controller.specialization.text = '';
        }

        if (edu['field_of_study'] != null) {
          final parsedSpec = edu['field_of_study'].toString();

          final specOptions =
              _specializationByDegree[controller.degree.text] ??
              _defaultSpecializations;

          if (!specOptions.contains(parsedSpec)) {
            _specializationByDegree[controller.degree.text]?.add(parsedSpec);
          }

          controller.specialization.text = parsedSpec;
        }

        controller.yearOfGraduation.text =
            controller.yearOfGraduation.text.isEmpty
            ? (edu['year']?.toString() ?? '')
            : controller.yearOfGraduation.text;

        controller.cgpa.text = controller.cgpa.text.isEmpty
            ? (edu['cgpa']?.toString() ?? '')
            : controller.cgpa.text;
      }

      setState(() {});
    } catch (e, s) {
    debugPrint("FULL ERROR: $e");
debugPrint("STACK: $s");

ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text("Something went wrong"),
  ),
);
    } finally {
      setState(() => _isParsingResume = false);
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

  /// 🔥 normalize
  final normalizedInput =
      trimmed.toLowerCase().replaceAll(' ', '');

  /// 🔥 find matching option from API
  String? matchedOption;

  for (final option in widget.options) {
    final normalizedOption =
        option.toLowerCase().replaceAll(' ', '');

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
      .map(
        (e) => e.toLowerCase().replaceAll(' ', ''),
      )
      .toSet();

  return widget.options.where((option) {
    final normalized =
        option.toLowerCase().replaceAll(' ', '');

    return option.toLowerCase().contains(query) &&
        !selectedNormalized.contains(normalized);
  }).take(8).toList();
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
