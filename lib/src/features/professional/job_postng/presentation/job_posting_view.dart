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
  String selectedCity = "Mumbai";

  // Tags — enum only, multi-select via Set
  final Set<String> selectedTags = {};

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              /// 🔥 JOB INFO
              _card(
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

              /// 🔥 LOCATION & WORK
              _card(
                title: "Location & Work",
                children: [
                  _dropdownDark(
                    "Location",
                    selectedCity,
                    indiaCities,
                    (val) => setState(() => selectedCity = val!),
                  ),

                  _dropdownDark(
                    "Employment Type",
                    employmentType,
                    ["Full-time", "Part-time"],
                    (val) => setState(() => employmentType = val!),
                  ),

                  _dropdownDark("Work Mode", workMode, [
                    "On-site",
                    "Remote",
                    "Hybrid",
                  ], (val) => setState(() => workMode = val!)),

                  _dropdownDark(
                    "Broadcast Type",
                    broadcastType,
                    ["Everyone", "Selected Colleges"],
                    (val) => setState(() => broadcastType = val!),
                  ),
                ],
              ),

              /// 🔥 EDUCATION & EXPERIENCE
              _card(
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

                  _ChipMultiSelectField(
                    key: ValueKey('fieldOfStudy_$minEducation'),
                    label: "Preferred Field of Study",
                    controller: fieldOfStudyController,
                    options: fieldOfStudyOptions,
                  ),

                  const SizedBox(height: 12),

                  _dropdownDark(
                    "Work Authorization",
                    workAuthorization,
                    workAuthorizationOptions,
                    (val) => setState(() => workAuthorization = val!),
                  ),

                  _dropdownDark(
                    "Experience Range",
                    experienceRange,
                    experienceOptions,
                    (val) => setState(() => experienceRange = val!),
                  ),

                  _fieldDark(
                    "Openings",
                    controller: openingsController,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),

              /// 🔥 PACKAGE DETAILS
              _card(
                title: "Package Details",
                children: [
                  _dropdownDark(
                    "Currency",
                    currencyController.text,
                    currencyOptions,
                    (val) => setState(() => currencyController.text = val!),
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

              /// 🔥 TAGS
              _card(title: "Tags", children: [_tagsEnumField()]),

              /// 🔥 SKILLS & CERTIFICATIONS
              _card(
                title: "Skills & Certifications",
                children: [
                  _ChipMultiSelectField(
                    key: const ValueKey('skills'),
                    label: "Skills",
                    controller: skillsController,
                    options: skillOptions,
                  ),

                  const SizedBox(height: 12),

                  _ChipMultiSelectField(
                    key: const ValueKey('certifications'),
                    label: "Certifications",
                    controller: certificationsController,
                    options: certificationOptions,
                  ),

                  const SizedBox(height: 12),

                  _ChipMultiSelectField(
                    key: const ValueKey('benefits'),
                    label: "Benefits",
                    controller: benefitsController,
                    options: benefitOptions,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// 🔥 SUBMIT BUTTON
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    final model = ReferralPostModel(
                      jobTitle: selectedJobTitle == "Others"
                          ? titleController.text.trim()
                          : selectedJobTitle,
                      description: descriptionController.text.trim(),
                      employmentType: employmentType,
                      workMode: workMode,
                      broadcastType: broadcastType,
                      jobType: "Referral",
                      location: [selectedCity],
                      minEducation: minEducation,
                      numberOfOpenings:
                          int.tryParse(openingsController.text) ?? 0,
                      packageDetails: PackageDetails(
                        currency: currencyController.text.trim(),
                        totalCTC: int.tryParse(totalCTCController.text) ?? 0,
                        fixedPay: int.tryParse(fixedPayController.text) ?? 0,
                        joiningBonus:
                            int.tryParse(joiningBonusController.text) ?? 0,
                      ),
                      skills: _splitController(skillsController),
                      studentStreams: _splitController(fieldOfStudyController),
                      tags: selectedTags.toList(),
                      workAuthorization: workAuthorization,
                      yearsOfExperience: experienceRange,
                      benefits: _splitController(benefitsController),
                      certifications: _splitController(
                        certificationsController,
                      ),
                      eligibilityCriteria: eligibilityController.text.trim(),
                      approvalStatus: 'Pending',
                    );

                    final success = await vm.postJob(model);

                    if (success && mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Referral Successfully Added"),
                          backgroundColor: Colors.green,
                        ),
                      );

                      Future.delayed(const Duration(seconds: 1), () {
                        if (mounted) Navigator.pop(context);
                      });
                    }
                  },
                  child: Text(
                    "Post Job",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
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
        maxLines: maxLines,
        keyboardType: keyboardType,
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
    String value,
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

// ─────────────────────────────────────────────────────────────────────────────
//  _ChipMultiSelectField — same widget as add_edit_profile_view
// ─────────────────────────────────────────────────────────────────────────────

class _ChipMultiSelectField extends StatefulWidget {
  const _ChipMultiSelectField({
    required this.label,
    required this.controller,
    required this.options,
    super.key,
  });

  final String label;
  final TextEditingController controller;
  final List<String> options;

  @override
  State<_ChipMultiSelectField> createState() => _ChipMultiSelectFieldState();
}

class _ChipMultiSelectFieldState extends State<_ChipMultiSelectField> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showFreeText = false;

  List<String> get _selectedItems {
    if (widget.controller.text.isEmpty) return [];
    return widget.controller.text
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  void _sync(List<String> items) {
    widget.controller.text = items.join(', ');
  }

  void _addItem(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return;
    final current = _selectedItems;
    if (!current.contains(trimmed)) {
      current.add(trimmed);
      _sync(current);
    }
    _textController.clear();
    _focusNode.requestFocus();
    setState(() {});
  }

  void _removeItem(String value) {
    final current = _selectedItems..remove(value);
    _sync(current);
    if (value == 'Others') setState(() => _showFreeText = false);
    setState(() {});
  }

  void _toggleEnumChip(String value) {
    final current = _selectedItems;
    if (current.contains(value)) {
      current.remove(value);
      _sync(current);
      if (value == 'Others') _showFreeText = false;
    } else {
      current.add(value);
      _sync(current);
      if (value == 'Others') _showFreeText = true;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selected = _selectedItems;
    final hasEnums = widget.options.isNotEmpty;
    final customItems = selected
        .where((s) => !widget.options.contains(s))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Enum chips ─────────────────────────────────────────
              if (hasEnums) ...[
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: widget.options.map((option) {
                    final isSelected = selected.contains(option);
                    return FilterChip(
                      backgroundColor: AppColors.kTile,
                      label: Text(option, style: TextStyle(color: Colors.grey)),
                      selected: isSelected,
                      onSelected: (_) => _toggleEnumChip(option),
                      selectedColor: AppColors.kGreen,
                      checkmarkColor: AppColors.white,
                      labelStyle: TextStyle(
                        color: isSelected ? AppColors.white : null,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
              ],

              // ── Custom items (free-text entries) ───────────────────
              if (customItems.isNotEmpty) ...[
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: customItems
                      .map(
                        (item) => Chip(
                          label: Text(item),
                          onDeleted: () => _removeItem(item),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 6),
              ],

              // ── Free-text input (shown when Others selected) ───────
              if (!hasEnums || _showFreeText) ...[
                if (hasEnums)
                  const Text(
                    'Add custom entries:',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                const SizedBox(height: 4),
                Autocomplete<String>(
                  optionsBuilder: (textEditingValue) {
                    if (textEditingValue.text.isEmpty) return const [];
                    return widget.options
                        .where(
                          (item) =>
                              item != 'Others' &&
                              item.toLowerCase().contains(
                                textEditingValue.text.toLowerCase(),
                              ),
                        )
                        .toList();
                  },
                  onSelected: _addItem,
                  fieldViewBuilder:
                      (context, textController, textFocusNode, onSubmit) {
                        return TextField(
                          controller: _textController,
                          focusNode: _focusNode,
                          decoration: const InputDecoration(
                            hintText: 'Type and press Enter to add',
                            border: InputBorder.none,
                            isDense: true,
                          ),
                          onSubmitted: _addItem,
                        );
                      },
                ),
              ],

              // ── Free-text only mode (no enums) ────────────────────
              if (!hasEnums && selected.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: selected
                      .map(
                        (item) => Chip(
                          label: Text(item),
                          onDeleted: () => _removeItem(item),
                        ),
                      )
                      .toList(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
