import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/view_model/job_posting_view_model.dart';

class ReferralPostView extends StatefulWidget {
  const ReferralPostView({super.key});

  @override
  State<ReferralPostView> createState() => _ReferralPostViewState();
}

class _ReferralPostViewState extends State<ReferralPostView> {
  final _formKey = GlobalKey<FormState>();

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
  String selectedJobTitle = "Software Developer";
  String employmentType = "Full-time";
  String workMode = "On-site";
  String broadcastType = "Everyone";
  String minEducation = "High School";
  String workAuthorization = "Citizens Only";
  String experienceRange = "0-1 years";
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

final int totalSteps = 6;

void nextStep() {
  if (currentStep < totalSteps - 1) {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

void previousStep() {
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
      queryParameters: {
        "country": "india",
      },
    );

    print("STATE DATA: ${res.data}");

    if (res.statusCode == 200 &&
        res.data["data"] != null &&
        res.data["data"]["states"] is List) {

      final List stateList = res.data["data"]["states"];

      states = stateList
          .map((e) => e["name"].toString())
          .toList();
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
      queryParameters: {
        "country": "india",
        "state": state.toLowerCase(),
      },
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
  @override
  void initState() {
    super.initState();
    fetchStates(); // 🔥 ADD THIS
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
    "Others",
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
    'Others',
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
    'Others',
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
    'Others',
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
          'Others',
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
          'Others',
        ];

      case "B.Sc":
        return [
          'Computer Science',
          'Mathematics',
          'Physics',
          'Chemistry',
          'Biotechnology',
          'Data Science',
          'Others',
        ];

      case "B.Com":
        return [
          'Accounting',
          'Finance',
          'Banking',
          'Taxation',
          'Economics',
          'Others',
        ];

      case "B.A":
        return [
          'English',
          'History',
          'Political Science',
          'Sociology',
          'Psychology',
          'Economics',
          'Law',
          'Others',
        ];

      case "BBA":
        return [
          'Marketing',
          'Finance',
          'Human Resources',
          'International Business',
          'Operations',
          'Entrepreneurship',
          'Others',
        ];

      /// MASTER DEGREES
      case "M.Tech":
        return [
          'Computer Engineering',
          'Software Engineering',
          'Data Science',
          'AI & ML',
          'Structural Engineering',
          'Others',
        ];

      case "M.Sc":
        return [
          'Computer Science',
          'Mathematics',
          'Physics',
          'Chemistry',
          'Biotechnology',
          'Data Science',
          'Others',
        ];

      case "M.Com":
        return [
          'Accounting',
          'Finance',
          'Banking',
          'Economics',
          'Taxation',
          'Others',
        ];

      case "MBA":
        return [
          'Marketing',
          'Finance',
          'Human Resources',
          'Operations',
          'Business Analytics',
          'International Business',
          'Others',
        ];

      case "MCA":
        return [
          'Software Development',
          'Data Science',
          'AI & ML',
          'Cyber Security',
          'Cloud Computing',
          'Others',
        ];

      case "M.Pharm":
        return [
          'Pharmaceutics',
          'Pharmacology',
          'Pharmaceutical Chemistry',
          'Quality Assurance',
          'Others',
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
          'Others',
        ];

      /// Diploma
      case "Postgraduate Diploma":
        return [
          'Management',
          'Data Science',
          'Cyber Security',
          'Finance',
          'Marketing',
          'Others',
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
    "Internship-eligible",
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

  final List<String> experienceOptions = [
    "0-1 years",
    "1-3 years",
    "3-5 years",
    "5-10 years",
  ];

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
    joiningBonusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ReferralPostViewModel>();

    return Scaffold(
      backgroundColor: AppColors.kBg,
      appBar: AppBar(
        backgroundColor: AppColors.kCard,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Post Referral",
          style: TextStyle(color: Colors.white),
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
                    _dropdownDark(
                      "Job Title",
                      selectedJobTitle,
                      jobTitleOptions,
                      (val) => setState(() => selectedJobTitle = val!),
                    ),

                    if (selectedJobTitle == "Others")
                      _fieldDark(
                        "Enter Custom Job Title",
                        controller: titleController,
                      ),

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
                              (val) => setState(
                                () => selectedCity = val!,
                              ),
                            ),

                    _dropdownDark(
                      "Employment Type",
                      employmentType,
                      ["Full-time", "Part-time"],
                      (val) =>
                          setState(() => employmentType = val!),
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

                    MultiSelectDropdownChips(
                      key: ValueKey(
                        'fieldOfStudy_$minEducation',
                      ),
                      label: "Preferred Field of Study",
                      controller: fieldOfStudyController,
                      options: fieldOfStudyOptions,
                    ),

                    const SizedBox(height: 12),

                    _dropdownDark(
                      "Experience Range",
                      experienceRange,
                      experienceOptions,
                      (val) => setState(
                        () => experienceRange = val!,
                      ),
                    ),

                    _fieldDark(
                      "Openings",
                      controller: openingsController,
                      keyboardType: TextInputType.number,
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
                  title: "Skills & Certifications",
                  children: [
                    MultiSelectDropdownChips(
                      key: const ValueKey('skills'),
                      label: "Skills",
                      controller: skillsController,
                      options: skillOptions,
                    ),

                    const SizedBox(height: 12),

                    MultiSelectDropdownChips(
                      key: const ValueKey(
                        'certifications',
                      ),
                      label: "Certifications",
                      controller: certificationsController,
                      options: certificationOptions,
                    ),

                    const SizedBox(height: 12),

                    MultiSelectDropdownChips(
                      key: const ValueKey('benefits'),
                      label: "Benefits",
                      controller: benefitsController,
                      options: benefitOptions,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

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
                          jobTitle:
                              selectedJobTitle == "Others"
                                  ? titleController.text.trim()
                                  : selectedJobTitle,
                                  inactive: false,
                          description:
                              descriptionController.text.trim(),
                   employmentType: [employmentType],
workMode: [workMode],
                          broadcastType: broadcastType,
                          jobType: "Referral",
                          location: [selectedCity],
                          minEducation: minEducation,
                          numberOfOpenings:
                              int.tryParse(
                                openingsController.text,
                              ) ??
                              0,
                          packageDetails: PackageDetails(
                            currency:
                                currencyController.text.trim(),
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
                          skills: _splitController(
                            skillsController,
                          ),
                          studentStreams:
                              _splitController(
                                fieldOfStudyController,
                              ),
                          tags: selectedTags.toList(),
                          workAuthorization:
                              workAuthorization,
                          yearsOfExperience:
                              experienceRange,
                          benefits: _splitController(
                            benefitsController,
                          ),
                          certifications:
                              _splitController(
                                certificationsController,
                              ),
                          eligibilityCriteria:
                              eligibilityController.text
                                  .trim(),
                          approvalStatus: 'Pending',
                        );

                        final success =
                            await vm.postJob(model);

                        if (success && mounted) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Referral Successfully Added",
                              ),
                            ),
                          );

                          Navigator.pop(context);
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
         ) ],
        ),
      ),
    ],
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

        const SizedBox(height: 10),

        /// 🔥 Chips
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
      ],
    );
  }
}
